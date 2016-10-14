class AddPagelinkToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :pagelink, :string
  end
end
