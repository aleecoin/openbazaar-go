#!/bin/bash -x

TARGETS=${1:-windows/386,windows/amd64,darwin/amd64,linux/386,linux/amd64,linux/arm}

export CGO_ENABLED=1
docker pull karalabe/xgo-latest
go get github.com/karalabe/xgo
mkdir -p dist
pushd dist/
xgo -ldflags '--ldflags -s' --targets=$TARGETS ../
chmod +x *
popd
