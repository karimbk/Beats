class AddZipcodeToRavers < ActiveRecord::Migration
  def change
    add_column :ravers, :zipcode, :string
  end
end
