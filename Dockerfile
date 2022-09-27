FROM node:16.15.1-alpine as build

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

#FROM nginx:stable-alpine

#COPY --from=build /app/build /usr/share/nginx/html

#COPY default.conf /etc/nginx/conf.d/default.conf:ro

#CMD ["nginx", "-g", "daemon off;"]
