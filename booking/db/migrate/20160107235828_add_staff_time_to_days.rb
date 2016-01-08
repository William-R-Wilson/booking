class AddStaffTimeToDays < ActiveRecord::Migration
  def change
    add_column :days, :hours, :decimal
  end
end
