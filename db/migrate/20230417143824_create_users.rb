# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :country_code
      t.integer :points

      t.timestamps
    end
  end
end
