# frozen_string_literal: true

class User < ApplicationRecord
  MIN_USER_POINTS = 150
  MAX_USER_POINTS = 1_000_000

  validates :username, presence: true, uniqueness: true
  validates :country_code, presence: true
  validates :points, numericality: { only_integer: true,
                                     greater_than_or_equal_to: MIN_USER_POINTS,
                                     less_than_or_equal_to: MAX_USER_POINTS }
end
