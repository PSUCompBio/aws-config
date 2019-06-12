# aws-config
This repo is used to create a docker image of the nsfcareer environment. Basically, after creating an instance we install docker on the instance and then run the dockerfile. The dockerfile calls the bash_config.sh script that has all the steps to make our environment.

 ## to create docker image
Make a ubuntu instance on AWS (Ubuntu Server 19.04 LTS, 64 bit, General Purpose, t2.2xlarge).


In Step 3: Configure Instance Details, under the Advanced Details option select User data -> "As file" -> Select "create_docker_image.sh" from your local machine.  This file is uploaded and run as part of the instance's initiation procedure and will run the dockerfile and create the docker image. 
