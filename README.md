# aws-config
This repo is used to create a docker image of the nsfcareer enviornment. Basically, after creating an instance we install docker on the instance and then run the dockerfile. The dockerfile calls the bash_config.sh script that has all the process. 

 ## to create docker image
 at propmpt
 
 sudo apt-get update 
 sudo apt-get install docker.io -y 

AWS bash script for installing packages needed for nsfcareer

You need to set the INSTANCE type first. Right now this can be either for AMI or Ubuntu instances on AWS. 

This file is uploaded when you create the instance (under configure instance details-> advanced details-> as file)
