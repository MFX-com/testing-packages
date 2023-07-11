FROM node:18.16-alpine@sha256:d5b2a7869a4016b1847986ea52098fa404421e44281bb7615a9e3615e07f37fb

RUN apk add --no-cache libc6-compat g++ make py3-pip
RUN apk update
RUN npm install -g pnpm@8.5.1

# Create app directory
WORKDIR /usr/src/app

RUN sleep 60

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json ./

RUN pnpm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "src/server.js" ]
