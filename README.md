# aws-config

This repo is used to create a docker image of the nsfcareer environment.

Basically, after creating an instance we install docker on the instance and then run the dockerfile.

The dockerfile calls the docker_scripts/config_bash.sh script that has all the steps to make our environment.

Login into AWS and make a Ubuntu instance

- Step 1 Choose an Instance: Ubuntu Server 18.04 LTS, 64 bit, General Purpose
- Step 2 Choose and Instance Type: t2.2xlarge (8 vCPUs, 32 GiB)
- Step 3 Configure Instance Details: Take defaults but under the "Advanced Details" option select User data -> "As file" -> Select "create_docker_image.sh" from your local machine. This file is uploaded and run as part of the instance's initiation procedure and will run the Dockerfile and create the docker image.
- Step 4 Add Storage: Change 8 to 25 GB
- Step 5 Add Tags: Take defaults
- Step 6 Configure Security Group: Under "Assign a security group" select, "select an existing security group" and choose nsfcareer. If you do not see that, you need to have ports 80 and 3000 open for Docker to work.

## Once docker image is created, you can test it:

### List the images created:

sudo docker ps -a OR sudo docker image ls

### Run the docker image:


$ cd /home/ubuntu/rbf-brain-nodejs-service

# Update the AWS Credentials
$ vim config/configuration_keys.json

# Save changes in configuration_keys.json file

# Now run command to set up node process for production
$ forever start server.js

# VERY IMPORTANT AFTER EXECUTING THE ABOVE COMMANDS

### http:ec-2-DNS-ENDPOINT/api/

#### Once inside the image:

- You can see the TestingProcedures.md to check all the codes that were compiled.

## Commit and push to dockerhub

sudo docker login -u USERNAME_ON_DOCKERHUB (be sure to have an account at https://hub.docker.com/)

sudo docker tag DOCKER_IMAGE_NAME USERNAME_ON_DOCKERHUB/nsfcareer:latest

sudo docker push USERNAME_ON_DOCKERHUB/nsfcareer:latest
