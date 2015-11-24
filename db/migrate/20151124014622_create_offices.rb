class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone

      t.timestamps null: false
    end
  end
end
