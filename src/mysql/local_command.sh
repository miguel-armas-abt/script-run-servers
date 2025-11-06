#!/bin/bash
set -e

get_command() {
  command="./mysqld --console"
  echo "$command"
}

get_command