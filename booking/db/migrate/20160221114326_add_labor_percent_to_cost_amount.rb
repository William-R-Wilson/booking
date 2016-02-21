class AddLaborPercentToCostAmount < ActiveRecord::Migration
  def change
    add_column :cost_amounts, :labor_percentage, :decimal
  end
end
