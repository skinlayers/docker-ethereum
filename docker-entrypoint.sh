#!/bin/bash
set -e

# if command starts with an option, prepend trezarcoind
if [ "${1:0:1}" = '-' ]; then
    set -- /usr/bin/geth "$@"
fi

exec "$@"
