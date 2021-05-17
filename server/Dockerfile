FROM alpine:latest
LABEL author="aomi.run"
RUN echo "https://mirrors.ustc.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories
RUN apk add --update curl bash && rm -rf /var/cache/apk/*

ENV CHASSIS_HOME=/data

WORKDIR $CHASSIS_HOME
COPY server $CHASSIS_HOME
COPY conf/microservice.yaml conf/chassis.yaml $CHASSIS_HOME/conf/

ENTRYPOINT ["/data/server"]
