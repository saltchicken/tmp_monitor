#!/bin/bash

# LOGFILE="/var/log/inotify_tmp_monitor_new.log"

# Run inotifywait and log the output
inotifywait -m -r -e create,modify,delete /tmp |
  while read path action file; do
    logger -t "inotify_tmp_monitor_tag" "INFO File $file was $action in $path"
    # TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    # echo "$TIMESTAMP INFO File $file was $action in $path" >>"$LOGFILE"
  done
