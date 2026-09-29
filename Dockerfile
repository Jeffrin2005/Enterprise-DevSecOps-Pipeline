# Secure Base Image
FROM node:22-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY server.js .

EXPOSE 8080
CMD [ "npm", "start" ]
