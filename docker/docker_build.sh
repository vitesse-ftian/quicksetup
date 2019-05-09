#!/usr/bin/env bash

user=`whoami`


sudo \
docker build \
  --network=host \
  -f Dockerfile \
  -t $user/xilinx-ml-suite \
  .
