FROM ubuntu

VOLUME /config/
COPY firstrun.sh /tmp/firstrun.sh

RUN apt-get update && \
    apt-get install -y \
        git-core \
	python \
	python-openssl && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /opt/headphones && \
    git clone https://github.com/rembo10/headphones.git /opt/headphones && \
    chmod +x /tmp/firstrun.sh; sync &&\
    /tmp/firstrun.sh &&\
    apt-get remove -y \
        git-core && \
    apt-get autoremove -y && \
    apt-get clean -y

EXPOSE 8282

VOLUME /mnt/media/music /mnt/media/downloads

CMD ["python", "/opt/headphones/Headphones.py", "-p", "8282", "--datadir=/config"]
