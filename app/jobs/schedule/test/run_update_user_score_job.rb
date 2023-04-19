module Schedule
  module Test
    class RunUpdateUserScoreJob
      include Sidekiq::Job

      queue_as :low

      def perform
        UpdateUserScoreJob.new.perform
        RunUpdateUserScoreJob.perform_in(1.second)
      end
    end
  end
end
