## Getting Started

To start app, you can use command

`docker compose build`

`docker compose up`

## Testing

To run all tests, you can use command

`docker compose run --rm wfapp sh -c "RAILS_ENV=test bundle exec rake db:reset && bundle exec rspec"`

## Generate test data

To generate test users, you can use command

`docker compose run --rm wfapp sh -c "bundle exec rake leaderboard_test:generate_users"`

## Update test data

To start test users updating job, you can use command

`docker compose run --rm wfapp sh -c "bundle exec rake leaderboard_test:update_users"`