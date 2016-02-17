class AddTimesToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :start_time, :time
    add_column :schedules, :end_time, :time
  end
end
