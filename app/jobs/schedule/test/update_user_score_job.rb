# frozen_string_literal: true

module Schedule
  module Test
    class UpdateUserScoreJob
      include Sidekiq::Job

      queue_as :low

      def perform
        delimiter = rand(4..32)
        delta = rand(-500..500)
        if delta.positive?
          User.where("id % #{delimiter} = 0")
              .where(points: (User::MIN_USER_POINTS - delta)..(User::MAX_USER_POINTS - delta))
              .update_all("points = points + #{delta}")
        else
          User.where("id % #{delimiter} = 0")
              .where(points: (User::MIN_USER_POINTS + delta)..(User::MAX_USER_POINTS + delta))
              .update_all("points = points + #{delta}")
        end
      end
    end
  end
end
