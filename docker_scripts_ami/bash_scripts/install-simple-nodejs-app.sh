git clone https://github.com/PSUCompBio/simple-nodejs-app
cd simple-nodejs-app
https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum -y install yarn nodejs
node index.js
