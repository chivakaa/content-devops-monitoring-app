FROM node:10-alpine
RUN mkdir -p /home/dan/app/node_modules && chown -R dan:dan /home/dan/app
WORKDIR /home/dan/app
COPY package*.json ./
RUN npm config set registry http://registry.npmjs.org/
RUN npm install
COPY . .
COPY --chown=dan:dan . .
USER dan
EXPOSE 8080
CMD [ "node", "index.js" ]
