# aws-config

This repo is used to create a docker image of the nsfcareer environment for the nsfcareer-api-service.

Basically, after creating an instance we install docker on the instance and then run the dockerfile.

The dockerfile calls the docker_scripts/config_bash.sh script that has all the steps to make our environment.

## to create docker image

Login into AWS and make a Ubuntu instance

- Step 1 Login to AWS, go to EC2, then to Launch Templates
- Step 2 Choose ApiServiceDockerBuild template. It has a bash script assigned to it for start up that will install this repo and run it.
- Step 3 Wait until building is done (about 1 hr), login into the instance and check if all tests passed.

## Once docker image is created, you can test it:

### List the images created:

sudo docker ps -a OR sudo docker image ls

### Run the docker image:

sudo docker run -it IMAGE_ID

#### Once inside the image:

- You can see the TestingProcedures.md to check all the codes that were compiled.

## Commit and push to dockerhub

### There are two different repos you can push to.

#### nsfcareer/api-service:production

sudo docker login -u USERNAME_ON_DOCKERHUB (be sure to have an account at https://hub.docker.com/)

- (This assumes your user name is in the dockerhub nsfcareer organization group)
  sudo docker tag DOCKER_IMAGE_ID nsfcareer/api-service:production

sudo docker push nsfcareer/api-service:production

#### nsfcareer/nsfcareer.ami:latest

This is what was used at first before using it for the api-service docker. Since this docker has much of the code stack we need,
it is great to start with. However, it is big (~11 GB) since it has so many dependencies.

sudo docker login -u USERNAME_ON_DOCKERHUB (be sure to have an account at https://hub.docker.com/)

sudo docker tag DOCKER_IMAGE_NAME USERNAME_ON_DOCKERHUB/nsfcareer:latest

sudo docker push USERNAME_ON_DOCKERHUB/nsfcareer:latest
