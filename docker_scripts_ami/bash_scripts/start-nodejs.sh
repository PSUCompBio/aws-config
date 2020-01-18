#!/bin/sh
forever start -a --uid simple_nodejs_app /var/www/simple_nodejs_app/index.js
 echo 'Success running the startup script for simple-nodejs_app!'
