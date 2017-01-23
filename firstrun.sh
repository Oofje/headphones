if [ ! -f /config/config.ini ]; then
	mkdir /config
	echo "[General]" > /config/config.ini
	echo "http_host = 0.0.0.0" >> /config/config.ini
fi
