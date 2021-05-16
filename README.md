### 1. 本地安装 <服务中心 ServiceCenter>
我的学习笔计是基于Docker环境,使用Docker-compose来编排,各平台如何安装Docker和docker-compose可自行搜索学习.

创建 Docker 网络
```sh
$ docker network create -d bridge --subnet=172.27.0.0/16 --gateway=172.27.0.1 aomi
```
创建 docker-compose.yml 文件
```yml
version: "3"

services:
  service-center:
    image: servicecomb/service-center
    container_name: service-center
    ports:
      - "30100:30100"
    restart: always
    volumes:
      - /etc/localtime:/etc/localtime
    networks:
      aomi:
        ipv4_address: 172.27.0.2
  
  service-frontend:
    image: servicecomb/scfrontend
    container_name: service-frontend
    environment:
      SC_ADDRESS: "service-center"
    ports:
      - "30103:30103"
    restart: always
    volumes:
      - /etc/localtime:/etc/localtime
    networks:
      aomi:
        ipv4_address: 172.27.0.3

networks:
  aomi:
    external: true
```

启动环境
```sh
$ docker-compose up -d
```

访问本地Web端口 http://127.0.0.1:30103

### 2. 创建项目
```sh
$ git clone https://github.com/aomirun/gochassis-start.git
$ cd gochassis-start
$ make bd
$ docker-compose up -d
```

访问本地Web端口 http://127.0.0.1:2002/hi
```sh
$ curl http://127.0.0.1:2002/hi
hello. go chassis
```