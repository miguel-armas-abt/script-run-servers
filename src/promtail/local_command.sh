#!/bin/bash
set -e

get_command() {
  command="./promtail-windows-amd64.exe --config.file=promtail-local-config.yaml"
  echo "$command"
}

get_command