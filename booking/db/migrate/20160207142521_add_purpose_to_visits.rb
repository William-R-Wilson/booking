class AddPurposeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :purpose, :text
  end
end
