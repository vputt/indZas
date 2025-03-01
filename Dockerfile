FROM node:18 AS build
WORKDIR /frontend
COPY task/frontend/package*.json ./
RUN npm install --legacy-peer-deps
COPY task/frontend/ ./
RUN npm run build

FROM nginx:alpine
COPY --from=build /frontend/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf