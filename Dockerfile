FROM alpine:3.16
WORKDIR /app
RUN apk --no-cache add tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ADD ./build/corepanel /app
ADD ./config.yml /app
CMD ["/app/corepanel"]