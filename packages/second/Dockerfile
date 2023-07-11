FROM node:20.4-alpine@sha256:8165161b6e06ec092cf5d02731e8559677644845567dbe41b814086defc8c261

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
