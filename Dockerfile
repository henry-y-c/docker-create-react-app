FROM alpine:latest

RUN apk update && \
    apk add --no-cache yarn && \
    yarn global add create-react-app && \
    mkdir -p /opt/project

VOLUME [ "/opt/project" ]    

WORKDIR /opt/project
