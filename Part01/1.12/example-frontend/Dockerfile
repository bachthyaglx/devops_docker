# Use a Node.js base image compatible with version 12
FROM node:12

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first (to leverage Docker cache)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the internal port the app uses
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
