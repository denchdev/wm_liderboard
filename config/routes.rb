# frozen_string_literal: true

require "sidekiq/web"

# Sidekiq::Web.use ActionDispatch::Cookies
# Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :public do
      namespace :v1 do
        resource :leaderboard, only: %i[show]
      end
    end
  end

  mount Sidekiq::Web => "/sidekiq"
  begin
    ActiveAdmin.routes(self)
  rescue StandardError
    ActiveAdmin::DatabaseHitDuringLoad
  end
end
