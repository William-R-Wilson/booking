class ChangeColumnWorkTypeIdInSchedules < ActiveRecord::Migration
  def change
    rename_column :schedules, :worktype_id, :work_type_id
  end
end
