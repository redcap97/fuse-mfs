#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/chflags/03.t,v 1.1 2007/01/17 01:42:08 pjd Exp $

desc="chflags returns ENAMETOOLONG if an entire path name exceeded 1023 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

require chflags

echo "1..13"

expect 0 mkdir ${name60} 0755
expect 0 mkdir ${name60}/${name60} 0755
expect 0 mkdir ${name60}/${name60}/${name60} 0755
expect 0 mkdir ${component4} 0755
expect 0 create ${component5} 0644
expect 0 chflags ${component5} UF_IMMUTABLE
expect 0 chflags ${component5} none
expect 0 unlink ${component5}
expect ENAMETOOLONG chflags ${path1024} UF_IMMUTABLE
expect 0 rmdir ${component4}
expect 0 rmdir ${name60}/${name60}/${name60}
expect 0 rmdir ${name60}/${name60}
expect 0 rmdir ${name60}
