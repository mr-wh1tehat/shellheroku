FROM node:11.10.0-slim
RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app
ENV TZ=Asia/Kolkata
RUN apt-get update && apt-get -y install python build-essential
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["node", "server"]
