ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}
COPY jwtsecret.hex /jwtsecret

ENTRYPOINT [ "sh", "-c", "exec ./Nethermind.Runner \
  --JsonRpc.Enabled=true \
  --JsonRpc.JwtSecretFile=/jwtsecret \ 
  --Init.BaseDbPath=/data \
  --Init.LogDirectory=/data/logs \
  $EXTRA_OPTS" ]
