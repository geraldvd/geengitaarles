FROM node:22.5-bookworm-slim as build-stage

# Install pnpm
RUN npm install -g pnpm

# Set the working directory
WORKDIR /code

# Copy package.json and pnpm-lock.yaml first to leverage Docker cache
COPY package.json pnpm-lock.yaml ./

# Install dependencies with pnpm
RUN pnpm install

# Copy the rest of the application code
COPY . .

# Run the build
RUN pnpm run build

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "./build"]
