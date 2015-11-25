class AddNeedsChildcareToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :needs_childcare, :boolean
  end
end
