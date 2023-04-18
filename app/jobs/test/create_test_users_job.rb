# frozen_string_literal: true

module Test
  class CreateTestUsersJob
    include Sidekiq::Job

    queue_as :low

    BATCH_SIZE = 100_000

    def perform(count: 100_000)
      while count.positive?
        batch = count > BATCH_SIZE ? BATCH_SIZE : count
        count -= BATCH_SIZE
        users_params = []
        batch.times do
          users_params << {
            username: FFaker::InternetSE.unique.user_name,
            points: rand(150..1_000_000),
            country_code: FFaker::Address.country_code
          }
        end

        User.upsert_all(
          users_params,
          unique_by: :username,
          record_timestamps: true
        )
      end
    end
  end
end
