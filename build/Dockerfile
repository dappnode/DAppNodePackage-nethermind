ARG VERSION
FROM nethermind/nethermind:$VERSION

COPY entrypoint.sh /entrypoint.sh
COPY mainnet_archive.cfg mainnet.cfg mainnet_advanced.cfg /nethermind/configs/

RUN addgroup -g 1000 nethermind \
    && adduser -u 1000 -G nethermind -s /bin/sh -D nethermind

ENTRYPOINT ["/entrypoint.sh"]
