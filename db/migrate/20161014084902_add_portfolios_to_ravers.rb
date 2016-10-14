class AddPortfoliosToRavers < ActiveRecord::Migration
  def change
    add_column :ravers, :portfolios, :json
  end
end
