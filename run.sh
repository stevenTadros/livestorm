#!/bin/sh

docker build . -t livestorm
docker run --rm -it livestorm ruby run.rb