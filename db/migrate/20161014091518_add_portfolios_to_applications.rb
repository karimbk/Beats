class AddPortfoliosToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :portfolios, :json
  end
end
