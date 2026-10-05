FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

EXPOSE 3000

CMD ["sh", "-c", "npm run dev || npm run start:dev || npm start || node server.js"]
