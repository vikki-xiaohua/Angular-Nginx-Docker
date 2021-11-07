### STAGE 1: Build ###
FROM node:17-alpine3.12 AS build
WORKDIR /Users/vicky/Downloads/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.21.3-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/angular-nginx-docker /usr/share/nginx/html
