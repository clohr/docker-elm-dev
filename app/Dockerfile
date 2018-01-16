FROM node:carbon

WORKDIR /usr/src/app

COPY ./package.json ./

RUN npm run install-app

COPY . .

CMD ["npm", "start"]