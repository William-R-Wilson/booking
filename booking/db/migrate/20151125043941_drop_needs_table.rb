class DropNeedsTable < ActiveRecord::Migration
  def up
    drop_table :needs
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
