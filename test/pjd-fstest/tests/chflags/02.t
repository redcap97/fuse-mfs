#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/chflags/02.t,v 1.1 2007/01/17 01:42:08 pjd Exp $

desc="chflags returns ENAMETOOLONG if a component of a pathname exceeded 255 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

require chflags

echo "1..6"

expect 0 create ${name60} 0644
expect 0 chflags ${name60} UF_IMMUTABLE
expect UF_IMMUTABLE stat ${name60} flags
expect 0 chflags ${name60} none
expect 0 unlink ${name60}
expect ENAMETOOLONG chflags ${name61} UF_IMMUTABLE
