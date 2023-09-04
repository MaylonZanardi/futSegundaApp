# Use an official Node.js runtime as a parent image
FROM node:16-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the production-ready React app
RUN npm run build

# Set the environment variable for production
ENV NODE_ENV=production

# Expose the port that the app will run on
EXPOSE 80

# Start the app
CMD ["npm", "start"]