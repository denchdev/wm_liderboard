#!/bin/sh

set -e

exec "$@"

bundle exec rake db:migrate && bundle exec rails tmp:clear log:clear

if [ -f .overmind.sock ]; then
  rm .overmind.sock
fi

