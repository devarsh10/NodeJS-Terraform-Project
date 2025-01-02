# Use the lightweight NGINX base image
FROM nginx:alpine
LABEL Author="Devarsh"

# Install Node.js and npm
RUN apk add --no-cache nodejs npm

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Specify the entry point for your Node.js application
ENTRYPOINT [ "node", "code.js" ]

# Expose port 3000 for the Node.js application
EXPOSE 3000
