FROM nethermind/nethermind:alpine

COPY entrypoint.sh /entrypoint.sh
COPY mainnet_archive.cfg mainnet.cfg mainnet_advanced.cfg /nethermind/configs/

ENTRYPOINT ["/entrypoint.sh"]


