class AddWaiveFacilityRentalToDays < ActiveRecord::Migration
  def change
    add_column :days, :waive_facility_rental, :boolean
  end
end
