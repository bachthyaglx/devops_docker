FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

ARG REACT_APP_BACKEND_URL
ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL

RUN npm run build
RUN npm install -g serve

EXPOSE 5000
CMD ["serve", "-s", "-l", "5000", "build"]
