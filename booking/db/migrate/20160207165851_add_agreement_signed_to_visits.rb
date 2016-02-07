class AddAgreementSignedToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :agreement_signed, :boolean
  end
end
