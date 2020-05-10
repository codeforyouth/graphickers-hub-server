#!/bin/bash
cd /home/rails/graphickers-hub
rails db:drop RAILS_ENV=production
sudo rm -rf /home/rails/graphickers-hub