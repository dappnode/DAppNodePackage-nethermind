ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y jq moreutils curl && \
    curl -LJO https://raw.githubusercontent.com/NethermindEth/nethermind/master/src/Nethermind/Nethermind.Runner/configs/xdai.cfg && \
    curl -LJO https://raw.githubusercontent.com/NethermindEth/nethermind/master/src/Nethermind/Nethermind.Runner/configs/xdai_archive.cfg

RUN cat xdai.cfg | jq '.JsonRpc.Host  = "0.0.0.0"' | jq ".Init.WebSocketsEnabled = true" | jq ".JsonRpc.Enabled  = true" | sponge xdai.cfg && \
    cat xdai_archive.cfg | jq '.JsonRpc.Host  = "0.0.0.0"' | jq ".Init.WebSocketsEnabled = true" | jq ".JsonRpc.Enabled  = true" | sponge xdai_archive.cfg

RUN cp xdai_archive.cfg xdai.cfg /nethermind/configs/

RUN groupadd -g 1000 nethermind && useradd -u 1000 -g nethermind -s /bin/sh nethermind

RUN apt update && apt install gosu

ENTRYPOINT ["/entrypoint.sh"]
