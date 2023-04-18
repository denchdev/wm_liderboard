# frozen_string_literal: true

class AddIndexesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :username, unique: true
    add_index :users, :country_code
    add_index :users, :points
  end
end
