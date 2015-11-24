class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :doctor_id
      t.integer :office_id

      t.timestamps null: false
    end
  end
end
