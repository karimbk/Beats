class CreateRavers < ActiveRecord::Migration
  def change
    create_table :ravers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :town
      t.string :phone

      t.timestamps null: false
    end
  end
end
