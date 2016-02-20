class CreateCostAmounts < ActiveRecord::Migration
  def change
    create_table :cost_amounts do |t|
      t.decimal :overhead
      t.decimal :salary
      t.decimal :plate_cost
      t.decimal :payroll_tax

      t.timestamps null: false
    end
  end
end
