#!/bin/bash
set -e

get_command() {
  command="./loki-windows-amd64.exe --config.file=loki-local-config.yaml"
  echo "$command"
}

get_command