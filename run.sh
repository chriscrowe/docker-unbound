#!/bin/bash
service unbound start
sleep 1

while true
do
  PID=$(pgrep unbound)
  if [ -z $PID ]; then
	  break
  fi
  sleep 1
done
