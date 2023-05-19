FROM node
WORKDIR /app
EXPOSE 3000
COPY ["./app", "/app"]
RUN npm install
CMD ["node", "server.js"]