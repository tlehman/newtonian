#!/bin/sh
# Downloads a stdout stream to websocket server tool

mkdir -p tmp

function os {
	uname | tr '[A-Z]' '[a-z]'
}

function github_url {
	printf "https://github.com/joewalnes/websocketd/releases/download/v0.2.12/websocketd-0.2.12-$(os)_amd64.zip"
}

curl -o tmp/websocketd.zip -L $(github_url)
