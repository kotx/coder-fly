#!/bin/sh
echo "Generating coder server cache..."

set -euxo pipefail

if [ -z $CODER_CACHE_DIRECTORY ]; then
	echo "CODER_CACHE_DIRECTORY unset, exiting..."
	exit
fi

timeout 120 /opt/coder server >/dev/null 2>&1 &
until [ -d $CODER_CACHE_DIRECTORY/site ] || [ ! -d /proc/$! ]
do
	echo "Waiting for $CODER_CACHE_DIRECTORY/site..."
	sleep 5
done

echo "Detected coder server cache!"
sleep 2
