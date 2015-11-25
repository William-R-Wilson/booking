class AddNeedsStafftimeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :needs_stafftime, :boolean
  end
end
