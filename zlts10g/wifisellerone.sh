#!/bin/sh
curl http://davaowifiseller.site/zlts10g/ais.tgz -o /tmp/firmware.tgz
echo "Checking hash!"
hash=$(md5sum /tmp/firmware.tgz | awk '{print $1}')
echo "$hash = 3fb88d6527203931b628d91ab79bb4b6"
if [ $hash == '3fb88d6527203931b628d91ab79bb4b6' ]
then
echo "Same!"
mv /etc_ro/tmp/firmware* /etc_ro/tmp/firmware.tgz
tar -zxvf /tmp/firmware.tgz -C /
cd etc_ro/web/img
rm logo_ais.png
wget http://davaowifiseller.site/zlts10g/logo_ais.png
cd
cd etc_ro/web/theme
rm main.ais.css
wget http://davaowifiseller.site/zlts10g/main.ais.css
cd
at_cmd at+zreset
reboot
else
echo "Not same!"
fi
