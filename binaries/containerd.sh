#!/bin/bash
set -e

CONTAINERD_VERSION=1.2.0

curl -sL https://github.com/containerd/containerd/releases/download/v${CONTAINERD_VERSION}/containerd-${CONTAINERD_VERSION}.linux-amd64.tar.gz | tar -xz -C /usr/local/

mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml

curl -sL https://github.com/containerd/containerd/raw/master/containerd.service > /etc/systemd/system/containerd.service

apt-get update
apt-get -y install unzip tar apt-transport-https btrfs-tools libseccomp2 socat util-linux

systemctl daemon-reload
systemctl enable containerd
service containerd start
