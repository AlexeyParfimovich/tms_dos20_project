#!/bin/sh
umask -S u=rwx,g=rx,o=rx
exec echo "[$(date -Iseconds)]" "$0" "$@" >>"/var/run/keepalived.$1.$2.state"

