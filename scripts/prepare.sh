#!/bin/bash
cd /var/www/rails
/root/.rbenv/shims/bundle install
/root/.rbenv/shims/rails db:create RAILS_ENV=production
/root/.rbenv/shims/rails db:migrate RAILS_ENV=production 