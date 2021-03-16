
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
	cd ./monitoring/prometheus && docker build -t ${user_name}/prometheus .

push-comment:
	docker push ${user_name}/comment:${tag}

push-post:
	docker push ${user_name}/post:${tag}

push-ui:
	docker push ${user_name}/ui:${tag}

push-prometheus:
	docker push ${user_name}/prometheus:${tag}

build-all: build-reddit build-prometheus

push-all: login push-comment push-post push-ui

up:
	cd ./docker && docker-compose up -d

down:
	cd ./docker && docker-compose down

monitoring-up:
	cd ./docker && docker-compose -f docker-compose-monitoring.yml up -d

monitoring-down:
	cd ./docker && docker-compose -f docker-compose-monitoring.yml down
