FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Try to build, but don't fail if build script doesn't exist
RUN npm run build 2>&1 | grep -v "missing script" || true

EXPOSE 3000

# Use a more flexible start command
CMD npm start || npm run dev || node server.js || npm run start:server
