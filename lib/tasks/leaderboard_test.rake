namespace :leaderboard_test do
  desc "Generate 1.5m test users"
  task generate_users: :environment do
    ::Test::CreateTestUsersJob.perform_async(count: 1_500_000)
  end

  desc "Start updating test users every second"
  task update_users: :environment do
    ::Schedule::Test::RunUpdateUserScoreJob.perform_async
  end
end
