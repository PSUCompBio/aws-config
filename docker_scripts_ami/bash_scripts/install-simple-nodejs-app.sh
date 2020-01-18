cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/simple-nodejs-app
mkdir /var/www
mv simple-nodejs-app /var/www/
cd /var/www/simple-nodejs-app
#https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -
sudo yum -y install yarn
sudo yum -y install nodejs
# Install forever
npm install forever -g
#mv rc.local /etc/rc.local
forever start -a --uid simple_nodejs_app index.js
