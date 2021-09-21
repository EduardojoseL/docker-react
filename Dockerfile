FROM node:alpine as builder

USER node 

RUN mkdir -p /home/node/app
WORKDIR /home/node/app 

COPY --chown=node:node ./package.json ./
RUN nmp install
COPY --chown=node:node ./ ./

RUN npm run build

FROM ngnix 
COPY --from=builder /home/node/app/build /usr/share/ngnix/html
