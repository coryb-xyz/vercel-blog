FROM node:26-bookworm AS builder

WORKDIR /app

RUN apt-get update && npx create-next-app --example blog-starter blog --yes

WORKDIR /app/blog

COPY ./next.config.js ./next.config.js

RUN npm run build

FROM dhi.io/node:26

WORKDIR /app/blog

COPY --from=builder --chown=65532:65532 /app/blog/.next/standalone ./
COPY --from=builder --chown=65532:65532 /app/blog/.next/static ./.next/static
COPY --from=builder --chown=65532:65532 /app/blog/public ./public

EXPOSE 3000

USER 65532:65532

ENV LOG_LEVEL=warn  HOSTNAME=0.0.0.0

ENTRYPOINT ["node", "server.js" ]
