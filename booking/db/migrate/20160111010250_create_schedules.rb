class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :day_id
      t.integer :employee_id
      t.decimal :hours
    end
  end
end
