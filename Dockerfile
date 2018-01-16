FROM debian:jessie
MAINTAINER kost - https://github.com/kost

ENV	ZCASH_URL=https://github.com/zcash/zcash.git \
	ZCASH_VERSION=v1.0.14 \
	ZCASH_CONF=/home/zcash/.zcash/zcash.conf

RUN mkdir -p /var/cache/apt/archives/ /var/cache/apt/archives/partial/ && \
    apt-get autoclean && apt-get autoremove && apt-get update && \
    apt-get -qqy install --no-install-recommends sudo apt-transport-https  \
    ca-certificates wget pwgen && \
    (wget -qO - https://apt.z.cash/zcash.asc | apt-key add -) && \
    (echo "deb [arch=amd64] https://apt.z.cash/ jessie main" | tee /etc/apt/sources.list.d/zcash.list) && \
    apt-get update && sudo apt-get -qqy install --no-install-recommends zcash && \
    rm -rf /var/lib/apt/lists/* && \
    adduser --uid 1000 --system zcash && \
    mkdir -p /home/zcash/.zcash/ && \
    chown -R zcash /home/zcash && \
    echo "Success"

USER zcash
RUN echo "rpcuser=zcash" > ${ZCASH_CONF} && \
	echo "rpcpassword=`pwgen 20 1`" >> ${ZCASH_CONF} && \
	echo "addnode=mainnet.z.cash" >> ${ZCASH_CONF} && \
	echo "Success"

VOLUME ["/home/zcash/.zcash"]
