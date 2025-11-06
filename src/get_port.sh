#!/bin/bash
set -e

source ./commons.sh
source ./../variables.env

get_server_port() {
  local yaml_file="$1"
  "$YQ" '.container.port // {}' "$yaml_file"
}

yaml_file=$1
get_server_port "$yaml_file"