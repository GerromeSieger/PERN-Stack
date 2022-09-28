FROM node:16.15.1-alpine as build

WORKDIR /app

COPY package.json .

RUN npm install

RUN npm uninstall webpack --save-dev

RUN npm install webpack@4.0.0 --save-dev

COPY . .

RUN npm run build

FROM nginx:stable-alpine

COPY --from=build /app/dist /usr/share/nginx/html

COPY --from=build . /usr/share/nginx/html

COPY default.conf /etc/nginx/conf.d/default.conf:ro

CMD ["nginx", "-g", "daemon off;"]
