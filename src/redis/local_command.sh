#!/bin/bash
set -e

get_command() {
  command="./redis-server &"
  echo "$command"
}

get_command