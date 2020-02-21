# Build Phase : Begin
FROM  node:alpine AS builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build
# Build Phase : End

# Hosting/Run Phase : Begin
FROM nginx AS webserver

COPY --from=builder /app/build /usr/share/nginx/html
# Hosting/Run Phase : End
