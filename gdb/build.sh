#!/bin/env bash

set -x

DATE=$(/usr/bin/date +%Y%m%d)

# Cleanup
IMAGES_STEPH=$(podman image ls -q -f reference=gdb:steph --no-trunc)
[[ -z ${IMAGES_STEPH} ]] || podman rmi -f ${IMAGES_STEPH##*:}

if [[ "$1" == "full" ]]; then
	podman rmi registry.opensuse.org/opensuse/tumbleweed:latest
fi

podman build -t gdb:${DATE} -f Containerfile.base .
podman tag gdb:${DATE} gdb:steph
