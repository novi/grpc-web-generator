TAG := yusukeito/grpc-web-generator:latest

build:
	docker build -t ${TAG} .
