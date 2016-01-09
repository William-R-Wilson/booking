class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :breakfast
      t.decimal :lunch
      t.decimal :dinner
      t.decimal :dorm
      t.decimal :horton
      t.decimal :lodge
      t.decimal :rentalfee
      t.belongs_to :visit
    end
  end
end
