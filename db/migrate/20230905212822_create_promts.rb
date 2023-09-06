class CreatePromts < ActiveRecord::Migration[7.0]
  def change
    create_table :promts do |t|
      t.string :text

      t.timestamps
    end
  end
end
