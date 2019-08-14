cd /home/$UNAMEX
wget https://github.com/gdrive-org/gdrive/releases/download/2.1.0/gdrive-linux-x64
mv gdrive-linux-x64 gdrive
chmod +x gdrive
install gdrive /usr/local/bin/gdrive
rm /home/$UNAMEX/gdrive
echo " -------------------------------------------------------------------"
echo " ----------            Complete Google Drive Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
