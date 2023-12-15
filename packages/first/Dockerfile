FROM node:18.17-alpine

RUN apk add --no-cache libc6-compat g++ make py3-pip
RUN apk update
RUN npm install -g pnpm@8.9.2

# Create app directory
WORKDIR /usr/src/app

#RUN sleep 60

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY . .

RUN pnpm install

EXPOSE 8080
CMD [ "node", "packages/first/src/server.js" ]
