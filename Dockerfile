#FROM node:lts-alpine
FROM node:16

WORKDIR /app

COPY package.turkey.json /app/package.json

# Install build tools and then run `npm install`
# This is done as a single RUN command to keep the image size small
RUN apt-get update && \
    apt-get install -y build-essential && \
    npm install

COPY app.js index.js /app/

CMD ["node", "app.js"]

