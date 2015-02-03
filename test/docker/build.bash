#!/usr/bin/env bash

set -ex

cd /tmp/
apt-get update
apt-get upgrade
apt-get install -y git build-essential pkg-config fuse libfuse-dev

git clone -b ${branch:-master} https://github.com/redcap97/fuse-mfs.git
pushd fuse-mfs/
make
make install PREFIX=/usr
popd

dd if=/dev/zero of=disk.img count=$((1024*16)) bs=1024
mkfs.mfs disk.img
mkdir disk
fuse-mfs -o allow_other,default_permissions,use_ino,attr_timeout=0 disk.img disk
fusermount -u disk
fsck.mfs disk.img
