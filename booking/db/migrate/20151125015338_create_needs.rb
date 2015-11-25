class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.boolean :projector
      t.boolean :childcare
      t.boolean :materials
      t.boolean :interpretation_equipment
      t.boolean :staff_time
      t.boolean :supplies

      t.timestamps null: false
    end
  end
end
