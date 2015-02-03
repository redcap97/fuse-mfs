#!/usr/bin/env bash

set -ex

BUILD_PATH=/tmp
CACHE_PATH=/cache

cd ${BUILD_PATH}

if [ -d "${CACHE_PATH}" ]; then
  cp -r ${CACHE_PATH} fuse-mfs
else
  git clone -b ${branch:-master} https://github.com/redcap97/fuse-mfs.git fuse-mfs
fi

pushd fuse-mfs
make clean all
make install PREFIX=/usr
popd

dd if=/dev/zero of=disk.img count=$((1024*16)) bs=1024
mkfs.mfs -B ${block_size:-4096} disk.img
mkdir disk
fuse-mfs -o allow_other,default_permissions,use_ino,attr_timeout=0 disk.img disk

pushd disk
make -C ${BUILD_PATH}/fuse-mfs/test/pjd-fstest clean all
prove -r ${BUILD_PATH}/fuse-mfs/test/pjd-fstest/tests
popd

fusermount -u disk
fsck.mfs disk.img
