FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN nmp install
COPY . .
RUN npm run build

FROM ngnix 
COPY --from=builder /app/build /user/share/ngnix 
