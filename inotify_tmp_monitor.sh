#!/bin/bash

LOGFILE="/var/log/inotify_tmp_monitor.log"

# Run inotifywait and log the output
inotifywait -m -r -e create,modify,delete /tmp |
  while read path action file; do
    echo "$(date '+%Y-%m-%d %H:%M:%S') - File $file was $action in $path" >>"$LOGFILE"
  done
