FROM node
WORKDIR /app
COPY ["./app", "/app"]
RUN npm install
CMD ["node", "server.js"]