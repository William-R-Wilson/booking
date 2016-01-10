class RemoveBelongsToVisitFromPrices < ActiveRecord::Migration
  def change
    remove_reference :prices, :visit
  end
end
