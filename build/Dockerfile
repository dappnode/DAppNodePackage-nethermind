ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}

ENTRYPOINT [ "sh", "-c", "exec ./Nethermind.Runner $EXTRA_OPTS" ]