class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments, id: :uuid do |t|
      t.string :instrument_name
      t.integer :manufacturing_year
      t.integer :number_of_devices
      t.string :description
      t.integer :price
      t.string :model
      t.references :lab, null: false, foreign_key: true, type: :uuid
      t.references :vendor, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
