# Secure Base Image: Using Debian Slim (gets patches faster than Alpine)
FROM node:22-slim

# THE HONEST WAY: 
# 1. Update and upgrade all OS-level packages to their latest secure versions
# 2. Upgrade npm to the latest version to fix node-pkg vulnerabilities
RUN apt-get update && apt-get upgrade -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    npm install -g npm@latest

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY server.js .

EXPOSE 8080
CMD [ "npm", "start" ]
