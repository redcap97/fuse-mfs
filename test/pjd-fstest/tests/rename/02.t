#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/rename/02.t,v 1.1 2007/01/17 01:42:10 pjd Exp $

desc="rename returns ENAMETOOLONG if an entire length of either path name exceeded 1023 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..14"

n0=`namegen`

expect 0 mkdir ${name60} 0755
expect 0 mkdir ${name60}/${name60} 0755
expect 0 mkdir ${name60}/${name60}/${name60} 0755
expect 0 mkdir ${component4} 0755
expect 0 create ${n0} 0644
expect 0 rename ${n0} ${component5}
expect 0 rename ${component5} ${n0}
expect ENAMETOOLONG rename ${n0} ${too_long}
expect 0 unlink ${n0}
create_too_long
expect ENAMETOOLONG rename ${too_long} ${n0}
unlink_too_long
expect 0 rmdir ${component4}
expect 0 rmdir ${name60}/${name60}/${name60}
expect 0 rmdir ${name60}/${name60}
expect 0 rmdir ${name60}
