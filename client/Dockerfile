FROM alpine:latest
LABEL author="aomi.run"
RUN echo "https://mirrors.ustc.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories
RUN apk add --update curl bash && rm -rf /var/cache/apk/*
WORKDIR /data
COPY client /data
EXPOSE 2002
ENTRYPOINT ["/data/client"]
