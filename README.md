# Mike-ntrt_microservices
Mike-ntrt microservices repository

### HW Lec 18 - Docker-4

The project base name sets from folder name  
How to Specifying the project name:  
'docker-compose -p project_name' or use var 'COMPOSE_PROJECT_NAME'  


### HW Lec 17 - Docker-3

the Microservices project

#### * - env vars

use the `--env-file` flag to set environment variables in the container
`src/env.list` - the file with env vars
```
docker run -d --network=reddit --network-alias=db_host mongo:latest
docker run -d --network=reddit --network-alias=post_host --env-file env.list nitrate/post:1.0
docker run -d --network=reddit --network-alias=comment_host --env-file env.list nitrate/comment:1.0
docker run -d --network=reddit -p 9292:9292 --env-file env.list nitrate/ui:1.0
```

#### ** - the thin image

`src/ui/Dockerfile1` uses the alpine:3.12 as the basic image
```
REPOSITORY  TAG   SIZE
nitrate/ui  3.0   274MB
nitrate/ui  2.0   458MB

```

### HW Lec 16 - Docker-2

- `dockermonolith/infra/terraform/main.tf` - describes YC instances
- `dockermonolith/infra/ansible/main.yml` - the playbok for install the docker, pull the image and run the container
- `dockermonolith/infra/ansible/dynamic-inventory.json.sh` hardcoded only for 2 instances created with terraform
