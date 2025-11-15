# Stage 1: Build React App
FROM node:18 AS build
WORKDIR /app

# Install dependencies first (cached)
COPY package*.json ./
RUN npm ci --legacy-peer-deps

# Copy rest of the code
COPY . .

# Build React app
RUN npm run build

# Stage 2: Nginx to serve the build
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
