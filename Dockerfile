FROM node:16-alpine3.12 as builder

WORKDIR /app

# COPY ./package.json .

RUN npm install -g npm@8.3.0
COPY . .
RUN npm install 

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

