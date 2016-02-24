class ChangeWorkTypesType < ActiveRecord::Migration
  def self.up
    rename_column :work_types, :type, :name
  end

  def self.down
  end
  
end
