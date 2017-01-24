FROM ubuntu

RUN apt-get update && \
    apt-get install -y \
        git-core \
	python \
	python-openssl && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /opt/headphones && \
    git clone https://github.com/rembo10/headphones.git /opt/headphones && \
    apt-get remove -y \
        git-core && \
    apt-get autoremove -y && \
    apt-get clean -y

EXPOSE 8282

VOLUME /mnt/media/music /mnt/media/downloads /config

CMD ["python", "/opt/headphones/Headphones.py", "--host=0.0.0.0", "--port=8282", "--datadir=/config", "--nolaunch"]
