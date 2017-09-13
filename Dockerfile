FROM node:8.4.0-alpine

ENV SERVERLESS_VERSION=1.21.1
WORKDIR /serverless

RUN apk add --update \
        groff \
        less \
        python \
      && apk add --virtual .builddeps \
        py-pip \
      && pip install --no-cache-dir \
        awscli \
      && apk --purge --no-cache del .builddeps \
      && yarn global add serverless@${SERVERLESS_VERSION}

USER node
ENTRYPOINT ["sls"]
