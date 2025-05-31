FROM node:16

WORKDIR /usr/src/app

COPY . .

# Let docker-compose override this with build args
ARG REACT_APP_BACKEND_URL=http://localhost:8080
ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL

RUN npm install
RUN npm install -g serve
RUN npm run build

EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]
