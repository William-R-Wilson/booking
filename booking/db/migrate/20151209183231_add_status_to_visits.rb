class AddStatusToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :status, :integer
  end
end
