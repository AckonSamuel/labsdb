class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments, id: :uuid do |t|
      t.string :instrument_name
      t.integer :manufacturing_year
      t.integer :number_of_devices
      t.string :description
      t.integer :price
      t.string :model
      t.string :range
      t.string :resolution
      t.integer :accuracy

      t.timestamps
    end
  end
end
