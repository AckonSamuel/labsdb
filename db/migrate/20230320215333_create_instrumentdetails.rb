class CreateInstrumentdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :instrumentdetails, id: :uuid do |t|
      t.string :range
      t.string :resolution
      t.integer :accuracy
      t.references :instrument, null: false, foreign_key: true, type: :uuid
      
      t.timestamps
    end
  end
end
