# syntax=docker/dockerfile:1
FROM node:18-alpine as base

WORKDIR /test

COPY package.json package.json

FROM base as test
RUN npm ci
COPY . .
RUN npm run test

FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
