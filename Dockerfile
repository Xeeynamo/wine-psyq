FROM i386/alpine:latest

RUN apk update
RUN apk add xvfb
RUN apk add wine

ENV DISPLAY=:0.0
WORKDIR /app
COPY . /app/

RUN wine winver
