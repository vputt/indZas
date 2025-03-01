FROM node:18 AS build
WORKDIR /frontend
COPY taski/frontend/ ./
RUN npm install --legacy-peer-deps
RUN npm run build

FROM nginx:alpine
COPY --from=build /frontend/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]