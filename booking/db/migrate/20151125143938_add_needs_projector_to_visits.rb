class AddNeedsProjectorToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :needs_projector, :boolean
  end
end
