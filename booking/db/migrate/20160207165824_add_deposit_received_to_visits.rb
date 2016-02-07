class AddDepositReceivedToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :deposit_received, :boolean
  end
end
