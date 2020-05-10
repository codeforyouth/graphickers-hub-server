#!/bin/bash
su - rails -c 'kill -KILL -s QUIT `cat /home/rails/graphickers-hub/tmp/pids/server.pid`'