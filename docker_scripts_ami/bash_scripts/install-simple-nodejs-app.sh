cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/simple-nodejs-app
mkdir /var/www
mv simple-nodejs-app /var/www/
cd /var/www/simple-nodejs-app
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
curl -sL https://rpm.nodesource.com/setup_12.x |  bash -
yum -y install yarn
yum -y install nodejs
# Install forever
npm install forever -g
# when we build the docker we don't want to actually
# run the forever start command. If we did this
# then it would be trying to run a web server from
# a stored docker image. Instead we want to initate this command
# when the docker image is pulled and run on an instance. So I need
# a script that runs when the docker image starts
#
#forever start -a --uid simple_nodejs_app index.js
