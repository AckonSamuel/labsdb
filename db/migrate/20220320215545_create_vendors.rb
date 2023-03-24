class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors, id: :uuid do |t|
      t.string :vendor_name
      t.string :location
      t.string :email
      t.string :website
      t.string :description
      
      t.timestamps
    end
  end
end
