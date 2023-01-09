#!/bin/sh

set -e

echo "ENVIRONMENT: $RAILS_ENV"

# check bundle
bundle check || bundle install

# remove pid from previous session (puma server)
if [ -f $APP_PATH/tmp/pids/server.pid ]; then
  rm $APP_PATH/tmp/pids/server.pid
fi

bundle exec rake assets:precompile
# run anything by prepending bundle exec to the passed command
bundle exec ${@}