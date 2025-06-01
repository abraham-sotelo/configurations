#!/bin/bash

pwd
cd "$(dirname "$0")"
ls
export UID_=$(id -u)
export GID_=$(id -g)
export USERNAME_=$(id -un)
export GROUPNAME_=$(id -gn)
export TZ_PATH_=$(readlink /etc/localtime)

docker build \
  --build-arg UID="${UID_}" \
  --build-arg GID="${GID_}" \
  --build-arg USERNAME="${USERNAME_}" \
  --build-arg TZ_PATH="${TZ_PATH_}" \
  --tag cdktf-dev:1.0 \
  -f $(readlink Dockerfile) .

