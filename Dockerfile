# BAD PRACTICE: Using an outdated, insecure base image (Trivy will catch this!)
FROM node:14-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY server.js .

EXPOSE 8080
CMD [ "npm", "start" ]
