#!/bin/bash
su - rails
kill -KILL -s QUIT `cat /home/rails/graphickers-hub/tmp/pids/server.pid`