class AddSuppliesPercentToCostAmount < ActiveRecord::Migration
  def change
    add_column :cost_amounts, :supplies_percentage, :decimal
  end
end
