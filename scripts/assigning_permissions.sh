#!/bin/bash

echo "-----------creating react app-----------------"
date
cd /home/$UNAMEX
npx create-react-app $WEBSITENAME
cd /home/$UNAMEX/$WEBSITENAME
npm run build
echo " -------------------------------------------------------------------"
echo " ----------           Complete Creating React Website         ------"
echo " -------------------------------------------------------------------"
cd /home/$UNAMEX
sudo chown -R $UNAMEX *

date
