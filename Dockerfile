ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}

# curl install throws error in ARM64 arch. It should not prevent build
RUN apt update && apt install -y curl || true

COPY /security /security
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
