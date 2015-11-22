class AddGuestToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :guest
  end
end
