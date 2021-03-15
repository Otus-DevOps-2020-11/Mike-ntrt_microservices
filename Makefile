
user_name = nitrate
tag=latest

login:
	docker login

build-reddit: build-comment build-post build-ui

build-comment:
	cd ./src/comment && bash ./docker_build.sh

build-post:
	cd ./src/post-py && bash ./docker_build.sh

build-ui:
	cd ./src/ui && bash ./docker_build.sh

build-prometheus:
	cd /monitoring/prometheus && docker build -t ${USER_NAME}/prometheus

push-comment:
	docker push ${USER_NAME}/comment:${tag}

push-post:
	docker push ${USER_NAME}/post:${tag}

push-ui:
	docker push ${USER_NAME}/ui:${tag}

push-prometheus:
	docker push ${USER_NAME}/prometheus:${tag}

build-all: build-reddit build-prometheus

push-all: login push-comment push-post push-ui

up:
	cd ./docker && docker-compose up -d

down:
	cd ./docker && docker-compose down
