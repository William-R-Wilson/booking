class AddNeedsSuppliesToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :needs_supplies, :boolean
  end
end
