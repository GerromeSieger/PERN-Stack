FROM node:16.15.1-alpine

COPY  package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]