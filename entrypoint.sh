#!/bin/sh

set -e

freshclam --stdout -v ||true
exec /sbin/runsvdir /etc/sv
