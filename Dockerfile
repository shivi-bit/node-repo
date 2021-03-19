FROM node:latest

WORKDIR /home/nodejs/app

COPY . .

RUN npm install --production

EXPOSE 3000

ENTRYPOINT ["npm","start"]

