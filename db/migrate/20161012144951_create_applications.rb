class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :raver, index: true, foreign_key: true
      t.string :competance
      t.string :motivation

      t.timestamps null: false
    end
  end
end
