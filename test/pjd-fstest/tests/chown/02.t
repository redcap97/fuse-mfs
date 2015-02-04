#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/chown/02.t,v 1.1 2007/01/17 01:42:08 pjd Exp $

desc="chown returns ENAMETOOLONG if a component of a pathname exceeded 255 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..5"

expect 0 create ${name60} 0644
expect 0 chown ${name60} 65534 65534
expect 65534,65534 stat ${name60} uid,gid
expect 0 unlink ${name60}
expect ENAMETOOLONG chown ${name61} 65533 65533
