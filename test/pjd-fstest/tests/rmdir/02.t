#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/rmdir/02.t,v 1.1 2007/01/17 01:42:11 pjd Exp $

desc="rmdir returns ENAMETOOLONG if a component of a pathname exceeded 255 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..4"

expect 0 mkdir ${name60} 0755
expect 0 rmdir ${name60}
expect ENOENT rmdir ${name60}
expect ENAMETOOLONG rmdir ${name61}
