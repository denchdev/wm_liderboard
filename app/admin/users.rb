# frozen_string_literal: true

ActiveAdmin.register User do
  filter :username
  filter :points, as: :numeric_range
  filter :country_code
end
