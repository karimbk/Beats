class AddRegionToRavers < ActiveRecord::Migration
  def change
    add_column :ravers, :region, :string, default: "TUNISIA"
  end
end
