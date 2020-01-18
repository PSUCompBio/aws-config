git clone https://github.com/PSUCompBio/simple-nodejs-app
mv simple-nodejs-app /var/www/html/
cd /var/www/html/simple-nodejs-app
https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum -y install yarn nodejs
# Install forever
npm install forever -g
node index.js
