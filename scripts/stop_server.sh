#!/bin/bash
kill -s QUIT `cat /var/www/rails/tmp/pids/server.pid`