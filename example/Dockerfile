FROM quay.io/mtpereira/serverless:1.16.1

USER root
RUN yarn install

USER node
CMD ["offline", "--host", "0.0.0.0", "--port", "3000"]
