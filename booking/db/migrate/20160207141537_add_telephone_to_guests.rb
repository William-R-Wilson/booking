class AddTelephoneToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :telephone, :string
  end
end
