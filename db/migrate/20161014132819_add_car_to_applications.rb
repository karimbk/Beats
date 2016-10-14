class AddCarToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :car, :string
  end
end
