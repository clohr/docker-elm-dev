FROM node:carbon

WORKDIR /usr/src/app

COPY ./package.json ./

RUN tree /usr/src/app/node_modules
RUN which elm

COPY . .

CMD ["npm", "start"]
