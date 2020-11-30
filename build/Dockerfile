ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y jq moreutils && \
    curl -LJO https://raw.githubusercontent.com/NethermindEth/nethermind/master/src/Nethermind/Nethermind.Runner/configs/mainnet.cfg && \
    curl -LJO https://raw.githubusercontent.com/NethermindEth/nethermind/master/src/Nethermind/Nethermind.Runner/configs/mainnet_archive.cfg

RUN cat mainnet.cfg | jq '.JsonRpc.Host  = "0.0.0.0"' | jq ".Init.WebSocketsEnabled = true" | jq ".JsonRpc.Enabled  = true" | sponge mainnet.cfg && \
    cat mainnet_archive.cfg | jq '.JsonRpc.Host  = "0.0.0.0"' | jq ".Init.WebSocketsEnabled = true" | jq ".JsonRpc.Enabled  = true" | sponge mainnet_archive.cfg && \
    cp mainnet.cfg mainnet_advanced.cfg

RUN cp mainnet_archive.cfg mainnet.cfg mainnet_advanced.cfg /nethermind/configs/

RUN groupadd -g 1000 nethermind && useradd -u 1000 -g nethermind -s /bin/sh nethermind

RUN apt update && apt install gosu

ENTRYPOINT ["/entrypoint.sh"]
