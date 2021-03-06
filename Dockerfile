FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install -g npm
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html