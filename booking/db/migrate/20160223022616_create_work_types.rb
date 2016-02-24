class CreateWorkTypes < ActiveRecord::Migration
  def change
    create_table :work_types do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
