class AddTierToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :tier, :string
  end
end
