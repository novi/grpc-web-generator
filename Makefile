TAG := yusukeito/grpc-web-generator:latest

build:
	docker build --platform linux/amd64 -t ${TAG} .
