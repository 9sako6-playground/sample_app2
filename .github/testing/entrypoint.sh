#!/bin/bash

yarn upgrade
bundle install
bundle update
bin/rails db:migrate
bundle exec rspec
