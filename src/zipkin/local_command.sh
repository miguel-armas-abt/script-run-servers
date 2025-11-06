#!/bin/bash
set -e

get_command() {
  export JAVA_HOME=$JAVA_HOME
  java="$JAVA_HOME/bin/java"

  command="$java -jar ./zipkin-server-3.3.0-exec.jar"
  echo "$command"
}

get_command