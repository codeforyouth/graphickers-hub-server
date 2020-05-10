#!/bin/bash
cp /var/sec/master.key /var/www/rails/config/master.key

cd /var/www/rails
/root/.rbenv/shims/bundle install
/root/.rbenv/shims/rails db:create RAILS_ENV=production
/root/.rbenv/shims/rails db:migrate RAILS_ENV=production 