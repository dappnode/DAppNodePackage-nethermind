ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}

RUN apt update && apt install -y curl

COPY /security /security
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
