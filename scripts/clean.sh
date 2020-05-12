#!/bin/bash
RAILS_FOLDER="/var/www/rails/"
if [ -d ${RAILS_FOLDER} ]; then
    rm -rf ${RAILS_FOLDER}
fi