#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/truncate/02.t,v 1.1 2007/01/17 01:42:12 pjd Exp $

desc="truncate returns ENAMETOOLONG if a component of a pathname exceeded 255 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..5"

expect 0 create ${name60} 0644
expect 0 truncate ${name60} 123
expect 123 stat ${name60} size
expect 0 unlink ${name60}
expect ENAMETOOLONG truncate ${name61} 123
