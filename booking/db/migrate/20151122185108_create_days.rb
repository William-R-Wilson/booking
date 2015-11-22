class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :breakfast
      t.integer :lunch
      t.integer :dinner
      t.integer :dorm
      t.integer :hh
      t.integer :lodge

      t.timestamps null: false
    end
  end
end
