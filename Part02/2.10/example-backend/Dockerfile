FROM golang:1.16

WORKDIR /usr/src/app

COPY . .

ENV PORT=8080
ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build

EXPOSE 8080

CMD ["./server"]
