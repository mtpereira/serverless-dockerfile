FROM docker.io/mtpereira/serverless:1.28.0

COPY package.json yarn.lock serverless.yml ./
RUN yarn install --pure-lockfile

CMD ["offline", "--host", "0.0.0.0", "--port", "3000"]
