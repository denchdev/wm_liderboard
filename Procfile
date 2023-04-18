web: bundle exec puma -C config/puma.rb -b 'ssl://0.0.0.0:443?key=server.key&verify_mode=none&cert=server.cert' -b 'tcp://0.0.0.0:80'
worker: bundle exec sidekiq -C config/sidekiq.yml
