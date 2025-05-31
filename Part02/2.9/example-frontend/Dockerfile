FROM node:16

WORKDIR /usr/src/app

COPY . .

# Set backend API to go through NGINX proxy
ARG REACT_APP_BACKEND_URL=/api
ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL

RUN npm install
RUN npm install -g serve
RUN npm run build

EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]
