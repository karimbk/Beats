class AddLanguageToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :language, :string
  end
end
