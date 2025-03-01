FROM node:18 AS build
COPY task/frontend/package*.json ./
RUN npm install --legacy-peer-deps
COPY task/frontend/ ./
RUN npm run build

FROM nginx:alpine
COPY --from=build /frontend/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

#RUN apk add --no-cache nodejs npm
#COPY --from=build /frontend/package.json /frontend/package-lock.json /usr/share/nginx/html/

#COPY nginx.conf /etc/nginx/nginx.conf