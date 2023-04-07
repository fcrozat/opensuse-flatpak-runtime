#!/bin/sh

SRC_COMMIT=$1
shift
DST_COMMIT=$1
shift
METADATA=$1
shift

set -e
DIR=`mktemp -d .commit-XXXXXX`

set -x
cp $METADATA $DIR/metadata
while (( "$#" )); do
    mkdir -p `dirname $DIR/$2`
    ostree checkout --repo=repo --subpath=$1 -U $SRC_COMMIT $DIR/$2
    shift 2
done
cat $METADATA | xargs -0 -I XXX ostree commit --repo=repo --no-xattrs --owner-uid=0 --owner-gid=0 --link-checkout-speedup -s "Commit" --branch $DST_COMMIT $DIR --add-metadata-string xa.metadata=XXX
rm -rf $DIR
