#TODO: used pinned version after initial install
# use node:lts-alpine as builder image
FROM node:lts-alpine as builder

# set working directory
WORKDIR /app

# copy package.json and package-lock.json
COPY package*.json ./

# install dependencies
RUN npm ci

# copy source code
COPY . .

# build app
RUN npm run build

# use node:lts-alpine as release image
FROM node:lts-alpine as release

# set working directory
WORKDIR /app

# copy ./build from builder image
COPY --from=builder /app/build ./

# copy package.json and package-lock.json and node_modules from builder image
COPY --from=builder /app/package*.json ./

#remove husky prepare script
RUN npm pkg delete scripts.prepare

# install production dependencies
RUN npm ci --only=production

# expose port 3000 or use PORT env variable
EXPOSE 3000

#run node server
CMD ["node", "src/index.js"]
