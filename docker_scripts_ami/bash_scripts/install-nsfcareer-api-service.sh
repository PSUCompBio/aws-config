cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/nsfcareer-api-service
mkdir /var/www
mv nsfcareer-api-service /var/www/
cd /var/www/nsfcareer-api-service
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
curl -sL https://rpm.nodesource.com/setup_12.x |  bash -
yum -y install yarn
yum -y install nodejs
# Install forever
npm install express -g
npm install forever -g
# install the node_modules direcotry and create package-lock.json
npm install
# when we build the docker we don't want to actually
# run the forever start command. If we did this
# then it would be trying to run a web server from
# a stored docker image. Instead we want to initate this command
# when the docker image is pulled and run on an instance. So I need
# a script that runs when the docker image starts
#
#forever start -a --uid simple_nodejs_app index.js
