FROM node:alpine

WORKDIR /usr/app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build
#Nginx is used for creating production server
#Copy build folder which got generated from above phase (npm run build) and add to nginx folder
FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html