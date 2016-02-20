class AddHourlyRateToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :hourly, :decimal
  end
end
