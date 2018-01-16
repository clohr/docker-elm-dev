FROM node:carbon

WORKDIR /usr/src/api

COPY ./package.json ./

RUN npm run install-api

COPY . .

CMD ["npm", "start"]