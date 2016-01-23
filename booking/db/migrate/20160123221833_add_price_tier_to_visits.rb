class AddPriceTierToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :price_tier, :string
  end
end
