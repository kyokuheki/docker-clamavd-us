#!/bin/sh

# prevent the zombie process

set -me

freshclam --stdout -v || true
freshclam -d --stdout -v -c1 &
clamd &

pids=`jobs -p`

rc=0

function cleanup() {
  trap "" SIGINT SIGQUIT SIGTERM SIGCHLD

  for pid in $pids; do
    if ! kill -0 $pid 2>/dev/null; then
      wait $pid
      rc=$?
    fi
  done
  kill $pids 2>/dev/null
}

trap cleanup SIGINT SIGQUIT SIGTERM SIGCHLD
wait

exit $rc
