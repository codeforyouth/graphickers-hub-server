#!/bin/bash
source ~/.bashrc

cd /var/www/rails
bundle install
rails db:create RAILS_ENV=production
rails db:migrate RAILS_ENV=production 