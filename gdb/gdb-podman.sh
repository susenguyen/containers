#!/bin/env bash

PID=$$

[[ -d /tmp/gdb-${PID} ]] || mkdir -p /tmp/gdb-${PID}

podman run -it -v /tmp/gdb-${PID}:/srv/steph --security-opt label=disable --name gdb --rm gdb:steph

# Intentionally not deleting /tmp/gdb-${PID} as /tmp is tmpfs on Tumbleweed
