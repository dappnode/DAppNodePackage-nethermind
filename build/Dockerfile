ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}

ENTRYPOINT [ "sh", "-c", "exec ./Nethermind.Runner --Init.BaseDbPath=/data --Init.LogDirectory=/data/logs $EXTRA_OPTS" ]