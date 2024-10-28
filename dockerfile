# Use the official Node.js image as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application source code to the container
COPY . .

# Set the PORT environment variable
ENV PORT=3000

# Expose the correct port your application runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
