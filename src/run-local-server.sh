#!/bin/bash
set -e

source ./commons.sh
source ./../variables.env

declare -A SERVER_PATHS
SERVER_LIST=()

validate_if_port_is_used() {
  local port=$1

  if netstat -an | grep LISTEN | grep -q ":$port "; then
    echo -e "${RED}Port $port is currently in use${NC}" >&2
    return 1
  fi
}

run_server() {
  local server_name=$1

  IFS='|' read -r absolute_path <<< "${SERVER_PATHS[$server_name]}"

  local original_dir
  original_dir="$(pwd)"

  port=$(./get_port.sh "./$server_name/$VALUES_FILE")
  validate_if_port_is_used "$port"

  command=$("./$server_name/local_command.sh")
  cd "$absolute_path"
  print_log "$command"

  print_title "$server_name - $port"
  eval "$command"
}

iterate_csv_records() {
  firstline=true
  local index=1

  SERVER_LIST=()
  SERVER_PATHS=()

  while IFS=',' read -r server_name absolute_path || [ -n "$server_name" ]; do

    # Ignore headers
    if $firstline; then
        firstline=false
        continue
    fi

    # Ignore comments
    if [[ $server_name != "#"* ]]; then
      SERVER_PATHS["$server_name"]="$absolute_path"
      SERVER_LIST+=("$server_name")
      echo "$index) $server_name"
      index=$((index + 1))
    fi

  done < <(sed 's/\r//g' "$SERVERS_CSV")
}

select_server() {
  iterate_csv_records
  read -rp "Enter the server number: " selection

  if ! [[ "$selection" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}Invalid option${NC}"
    return 1
  fi

  local count="${#SERVER_LIST[@]}"
  if (( selection < 1 || selection > count )); then
    echo -e "${RED}Server not found${NC}"
    return 1
  fi

  local server_name="${SERVER_LIST[$((selection - 1))]}"
  run_server "$server_name"
}

select_server