FROM docker.pkg.github.com/ciftcicagatay/meteor-application/meteor-builder:sha-80db717 AS builder

ENV SRC_DIR /usr/src
ENV BUNDLE_DIR /usr/bundle
ENV METEOR_ALLOW_SUPERUSER true

COPY . $SRC_DIR

WORKDIR $SRC_DIR

RUN npm install --production
RUN meteor build --server-only --directory $BUNDLE_DIR
RUN cd ${BUNDLE_DIR}/bundle/programs/server && npm install

FROM node:12.14.1-alpine

ENV ROOT_URL='http://localhost:3000/'
ENV MONGO_URL='mongodb://mongo:27017/meteor'
ENV PORT='3000'

ENV APP_DIR /usr/app
ENV BUNDLE_DIR /usr/bundle

USER node:node

COPY --from=builder $BUNDLE_DIR $APP_DIR

WORKDIR $APP_DIR/bundle

EXPOSE 3000

CMD ["node", "./main.js"]
