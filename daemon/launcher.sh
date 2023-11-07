#!/bin/bash
# https://stackoverflow.com/a/246128/147530
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# Specify the path to your Java application JAR file
APP_DIR="$SCRIPT_DIR/.."
echo "$APP_DIR"

start() {    
  # TODO: need to ensure that application is not already running
    cd $APP_DIR 
    # https://stackoverflow.com/a/7814594/147530
    # redirect both input and output to the null device
    echo "starting spring boot application..."
  nohup mvn spring-boot:run < /dev/null > /dev/null 2>&1 &
  echo $! > demo-app.pid
}

stop() {
  cd $APP_DIR 
  PID=$(cat demo-app.pid)
  echo "stopping spring boot application PID: $PID"
  kill $PID
}

case $1 in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
    ;;
esac
