 #!/bin/bash
cd /home/ec2-user
source /home/ec2-user/.bash_profile
##
## npm will automatically pick up the server.js file in
## nsfcareer-api-service
npm run start --prefix /var/www/nsfcareer-api-service

#forever -a --uid start /var/www/nsfcareer-api-service/server.js
echo 'Success running the startup script for nsfcareer-api-service!'
