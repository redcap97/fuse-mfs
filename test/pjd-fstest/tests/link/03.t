#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/link/03.t,v 1.1 2007/01/17 01:42:09 pjd Exp $

desc="link returns ENAMETOOLONG if an entire length of either path name exceeded 1023 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..16"

n0=`namegen`

expect 0 mkdir ${name60} 0755
expect 0 mkdir ${name60}/${name60} 0755
expect 0 mkdir ${name60}/${name60}/${name60} 0755
expect 0 mkdir ${component4} 0755
expect 0 create ${component5} 0644
expect 0 link ${component5} ${n0}
expect 0 unlink ${component5}
expect 0 link ${n0} ${component5}
expect 0 unlink ${component5}
create_too_long
expect ENAMETOOLONG link ${n0} ${too_long}
unlink_too_long
expect 0 unlink ${n0}
create_too_long
expect ENAMETOOLONG link ${too_long} ${n0}
unlink_too_long
expect 0 rmdir ${component4}
expect 0 rmdir ${name60}/${name60}/${name60}
expect 0 rmdir ${name60}/${name60}
expect 0 rmdir ${name60}
