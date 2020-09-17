ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}

COPY entrypoint.sh /entrypoint.sh
COPY mainnet_archive.cfg mainnet.cfg mainnet_advanced.cfg /nethermind/configs/

RUN groupadd -g 1000 nethermind && useradd -u 1000 -g nethermind -s /bin/sh nethermind

RUN apt update && apt install gosu

ENTRYPOINT ["/entrypoint.sh"]
