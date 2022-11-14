ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}


COPY /security /security
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]