FROM node:12-alpine3.10

WORKDIR /usr/app

COPY package*.json ./

RUN npm install 

COPY . .

ENV PORT=3001
ENV DEV_SERVER_PORT=3000
ENV DATABASE_URL=postgres://pos:0000@postgres:5432/pos
ENV SESSION_SECRET=secret
ENV SESSION_EXPIRY=28800000

RUN apk add --no-cache bash

RUN npm run build

EXPOSE 3001 

CMD ["npm", "run", "start"]
