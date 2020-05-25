#!/bin/bash

yarn upgrade
bundle config set path 'vendor/bundle'
bundle install --jobs 4 --retry 3
bundle update
bin/rails db:migrate
bundle exec rspec
