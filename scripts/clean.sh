#!/bin/bash
cd /var/www/rails
rails db:drop RAILS_ENV=production
sudo rm -rf /var/www/rails