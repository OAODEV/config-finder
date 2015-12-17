FROM alpine:latest
MAINTAINER jesse.miller@adops.com

RUN apk update && apk add --update python python3

ADD . /testing

WORKDIR /testing

# Run the tests
RUN python -m unittest discover
RUN python3 -m unittest discover

