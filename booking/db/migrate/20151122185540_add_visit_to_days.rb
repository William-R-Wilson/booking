class AddVisitToDays < ActiveRecord::Migration
  def change
    add_reference :days, :visit
  end
end
