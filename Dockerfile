FROM alpine:3.16
WORKDIR /app
ADD ./build/corepanel /app
ADD ./config.yml /app
CMD ["/app/corepanel"]