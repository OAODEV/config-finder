FROM alpine:latest
MAINTAINER jesse.miller@adops.com

RUN apk update && apk add --update python python3

RUN mkdir /secret

ADD . /testing

WORKDIR /testing

# Run the tests

CMD python -m unittest discover; python3 -m unittest discover

