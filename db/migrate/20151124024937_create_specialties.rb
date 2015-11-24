class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.integer :doctor_id
      t.integer :field_id

      t.timestamps null: false
    end
  end
end
