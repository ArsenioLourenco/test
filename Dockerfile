# syntax=docker/dockerfile:1
FROM node:18-alpine as base

WORKDIR /test

COPY . .

FROM base as test
RUN npm ci
COPY . .
RUN npm run test

FROM base as prod
COPY . .
CMD [ "node", "server.js" ]
