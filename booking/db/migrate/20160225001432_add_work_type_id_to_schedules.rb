class AddWorkTypeIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :worktype_id, :integer
  end
end
