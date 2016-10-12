class AddStreetToRavers < ActiveRecord::Migration
  def change
    add_column :ravers, :street, :string
  end
end
