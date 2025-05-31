FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl

WORKDIR /usr/src/app

COPY script.sh .

CMD ["./script.sh"]
