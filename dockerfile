# Use an official Node.js image as the base for building the React app
FROM node:18 as build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Use a lightweight server to serve the React app
FROM nginx:stable-alpine

# Add custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the built React app from the previous stage to the Nginx web root
COPY --from=build /app/build /usr/share/nginx/html


EXPOSE 3000

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
