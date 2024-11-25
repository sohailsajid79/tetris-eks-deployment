# Stage 1: Build application

FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Serve application with NGINX

FROM nginx:alpine

# Copy the build output to the NGINX directory
COPY --from=builder /app/dist /usr/share/nginx/html

# default NGINX configuration to listen on port 80
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
