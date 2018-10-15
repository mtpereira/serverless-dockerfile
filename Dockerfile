FROM node:10.12.0-alpine

ENV SERVERLESS_VERSION=1.32.0

RUN apk add --update \
        groff \
        less \
        python \
      && apk add --virtual .builddeps \
        py-pip \
      && pip install --no-cache-dir \
        awscli \
      && apk --purge --no-cache del .builddeps \
      && yarn global add serverless@${SERVERLESS_VERSION} \
      && mkdir /serverless \
      && chown node /serverless

USER node
WORKDIR /serverless
ENTRYPOINT ["sls"]
