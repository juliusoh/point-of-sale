FROM node:12-alpine3.10

WORKDIR /usr/app

COPY package*.json ./

RUN npm install 

COPY . .

RUN apk add --no-cache bash

RUN npm run build

EXPOSE 3001 

CMD ["npm", "run", "start"]
