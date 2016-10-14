class AddAvailabilityToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :availability, :string
  end
end
