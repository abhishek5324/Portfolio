# Use Node.js 14 LTS as base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Run npm run compile:scss to compile SCSS files
# RUN npm run compile:scss

# Install http-server to serve static files
RUN npm install -g http-server

# Expose the port your app runs on
EXPOSE 8080

# Command to run your app
CMD ["http-server", "-p", "8080"]
