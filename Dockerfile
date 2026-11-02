# Import from Package
FROM node:20 AS builder

# Workdir
WORKDIR /app

# Copying the packages
COPY package.json package-lock.json ./

# Run all the packages
RUN npm install

# Copying the dependencies
COPY . .

# Second stage
FROM node:20

# WorkDir
WORKDIR /app

# Copying directory
COPY --from=builder /app /app

EXPOSE 3000

CMD ["node", "index.js"]