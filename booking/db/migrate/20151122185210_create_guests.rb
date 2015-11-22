class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :email
      t.string :address
      t.string :address2
      t.string :city
      t.string :zip
      t.string :state
      t.string :name
      t.string :bill_to

      t.timestamps null: false
    end
  end
end
