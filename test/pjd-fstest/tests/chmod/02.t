#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/chmod/02.t,v 1.1 2007/01/17 01:42:08 pjd Exp $

desc="chmod returns ENAMETOOLONG if a component of a pathname exceeded 255 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..5"

expect 0 create ${name60} 0644
expect 0 chmod ${name60} 0620
expect 0620 stat ${name60} mode
expect 0 unlink ${name60}
expect ENAMETOOLONG chmod ${name61} 0620
