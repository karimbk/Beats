class AddGenderToRavers < ActiveRecord::Migration
  def change
    add_column :ravers, :gender, :integer
  end
end
