#!/bin/bash
set -e

get_command() {
  command=".\\\\bin\\\\windows\\\\kafka-server-start.bat config\\\\server.properties"
  echo "$command"
}

get_command