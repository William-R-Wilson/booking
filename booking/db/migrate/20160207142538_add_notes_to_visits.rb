class AddNotesToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :notes, :text
  end
end
