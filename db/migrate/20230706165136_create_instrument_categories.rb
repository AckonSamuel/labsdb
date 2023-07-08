class CreateInstrumentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :instrument_categories, id: :uuid do |t|
      t.references :instrument, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
