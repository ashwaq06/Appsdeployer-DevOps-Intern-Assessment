FROM node:14-slim

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

RUN groupadd -r nodejs && useradd -m -r -g nodejs ashwaq

RUN chown -R ashwaq:nodejs /app

USER ashwaq

CMD ["node", "server.js"]

