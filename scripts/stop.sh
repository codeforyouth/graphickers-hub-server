#!/bin/bash
PID_FILE="/var/www/rails/tmp/pids/server.pid"
if [ -f ${PID_FILE} ]; then
    kill -s QUIT `cat ${PID_FILE}`
fi