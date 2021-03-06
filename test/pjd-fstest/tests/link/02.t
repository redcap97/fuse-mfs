#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/link/02.t,v 1.1 2007/01/17 01:42:09 pjd Exp $

desc="link returns ENAMETOOLONG if a component of either pathname exceeded 255 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..10"

n0=`namegen`

expect 0 create ${name60} 0644
expect 0 link ${name60} ${n0}
expect 0 unlink ${name60}
expect 0 link ${n0} ${name60}
expect 0 unlink ${n0}
expect 0 unlink ${name60}

expect 0 create ${n0} 0644
expect ENAMETOOLONG link ${n0} ${name61}
expect 0 unlink ${n0}
expect ENAMETOOLONG link ${name61} ${n0}
