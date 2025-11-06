#!/bin/bash
set -e

get_command() {
  command="./bin/pg_ctl -D ./data -l logging_postgresql.log start"
  echo "$command"
}

get_command