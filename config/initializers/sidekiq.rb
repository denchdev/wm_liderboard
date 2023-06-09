# frozen_string_literal: true

require "sidekiq/web"
require "sidekiq-scheduler"

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  # Protect against timing attacks:
  # - See https://codahale.com/a-lesson-in-timing-attacks/
  # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
  # - Use & (do not use &&) so that it doesn't short circuit.
  # - Use digests to stop length information leaking (see also ActiveSupport::SecurityUtils.variable_size_secure_compare)
  ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                              ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])) &
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))
end

Sidekiq.configure_server do |config|
  schedule_file = "config/scheduler.yml"

  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(schedule_file)
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end
