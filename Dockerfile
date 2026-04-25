#################
## FIRST PHASE ##
#################
FROM node:latest AS builder

WORKDIR /app

COPY ./package.json .

RUN yarn install 

##################
## SECOND PHASE ##
##################

FROM node:25.9-slim

WORKDIR /app

COPY --from=builder /app/node_modules/ /app/node_modules/ 
COPY . .

EXPOSE 3000

CMD ["npm","start"]

