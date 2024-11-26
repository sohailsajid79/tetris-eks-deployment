# Stage 1: Build application

FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#Production

FROM nginx:alpine
RUN addgroup -S team-delta && adduser -S team-delta -G team-delta
COPY --from=builder /app/dist /usr/share/nginx/html
RUN chown -R team-delta:team-delta /usr/share/nginx/html
USER team-delta
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
