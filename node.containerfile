FROM node:22-alpine

RUN apk add --no-cache bash

USER node

WORKDIR /app

ENTRYPOINT ["bash"]
