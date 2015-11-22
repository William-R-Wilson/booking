class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :num_attendees
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
