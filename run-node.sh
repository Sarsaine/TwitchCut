#!/usr/bin/env sh

source ./env.sh && \
podman build -t tc-node -f node.containerfile transformer && \
podman run --rm -it --userns=keep-id -v $PWD/transformer:/app:z -v $VIDEOS_DIR:/videos:z tc-node
