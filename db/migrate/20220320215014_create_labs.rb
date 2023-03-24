class CreateLabs < ActiveRecord::Migration[7.0]
  def change
    create_table :labs, id: :uuid do |t|
      t.string :lab_name
      t.string :lab_location

      t.timestamps
    end
  end
end
