FROM quay.io/mtpereira/serverless:1.21.1

COPY package.json yarn.lock ./
RUN yarn install --pure-lockfile

CMD ["offline", "--host", "0.0.0.0", "--port", "3000"]
