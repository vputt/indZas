FROM node:18 AS build
WORKDIR /frontend
COPY task/frontend/ ./
RUN npm install --legacy-peer-deps
RUN npm run build

FROM nginx:alpine
RUN apk add --no-cache nodejs npm
COPY --from=build /frontend/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf