BUILD_DIR := ./build
SERVICENAME := hello

.PHONE: pro
pro:
	protoc --gogofaster_out=. ./proto/hello/hello.proto

.PHONE: bd
bd:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o $(BUILD_DIR)/server/server ./server/*.go
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o $(BUILD_DIR)/client/client ./client/*.go
	cp -r ./server/conf $(BUILD_DIR)/server
	cp ./server/Dockerfile $(BUILD_DIR)/server
	cp -r ./client/conf $(BUILD_DIR)/client
	cp ./client/Dockerfile $(BUILD_DIR)/client

.PHONE: clear
clear:
	rm -rf $(BUILD_DIR)
