class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :subject

      t.timestamps null: false
    end
  end
end
