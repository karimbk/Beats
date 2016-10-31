class CreateGuestlists < ActiveRecord::Migration
  def change
    create_table :guestlists do |t|
      t.string :name
      t.integer :number , default: 1
      t.integer :status , default: 0

      t.timestamps null: false
    end
  end
end
