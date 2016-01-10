class AddBelongsToPriceToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :price, index: true, foreign_key: true
  end
end
