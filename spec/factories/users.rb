# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { FFaker::InternetSE.unique.user_name }
    country_code { FFaker::Address.country_code }
    points { rand(User::MIN_USER_POINTS..User::MAX_USER_POINTS) }
  end
end
