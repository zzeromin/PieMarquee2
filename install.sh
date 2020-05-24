#!/bin/bash
#run as root user
if [ "$(whoami)" != "root" ]; then
	echo "Switching to root user..."
	sudo bash $scriptfile $*
	exit 1
fi

apt-get update
apt-get install libjpeg8 imagemagick -y

chmod 755 /home/pi/PieMarquee2/omxiv-marquee

sed -i '/PieMarquee2.py/d' /opt/retropie/configs/all/autostart.sh
sed -i '1i\\/usr/bin/python /home/pi/PieMarquee2/PieMarquee2.py &' /opt/retropie/configs/all/autostart.sh

echo
echo "Setup Completed. Reboot after 3 Seconds."
sleep 3
reboot
