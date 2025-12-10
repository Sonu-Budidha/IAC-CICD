FROM node:18-alpine

WORKDIR /usr/src/app

# copy package files only
COPY app/package*.json ./
RUN npm install

# now copy the rest of the app
COPY app/ .

EXPOSE 8080
CMD ["node", "server.js"]

