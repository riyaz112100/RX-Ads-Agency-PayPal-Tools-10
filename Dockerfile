# Use the official Puppeteer image which comes with all dependencies
FROM ghcr.io/puppeteer/puppeteer:21.5.0

# Switch to root user to install npm dependencies
USER root

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application files
COPY . .

# Switch back to the non-root puppeteer user
USER pptruser

# Expose the port the app runs on
EXPOSE 10000

# Start the app
CMD ["npm", "start"]
