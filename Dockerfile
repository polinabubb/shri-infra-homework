#FROM node:20-alpine
#RUN apk add --no-cache python3 g++ make
#WORKDIR /src
#COPY . .
#RUN npm run build
#RUN npm install
#CMD ["node", "/src/client/index.tsx"]

#COPY package.json .
#COPY package.json package-lock.json ./
#CMD start:docker
FROM node:20-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm ci

COPY . .

#ENV FASTIFY_ADDRESS 0.0.0.0

# Команда, которая запускается автоматически
# при старте контейнера
CMD ["npm", "start"]
