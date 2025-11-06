#!/bin/bash
set -e

source ./commons.sh
source ./../variables.env

get_command() {
  if [[ -d "$KAFKA_TMP_FOLDER" ]]; then
    rm -rf "$KAFKA_TMP_FOLDER"
    print_log "Folder $KAFKA_TMP_FOLDER was removed"
  fi

  command=".\\\\bin\\\\windows\\\\zookeeper-server-start.bat config\\\\zookeeper.properties"
  echo "$command"
}

get_command