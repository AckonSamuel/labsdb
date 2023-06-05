# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(0..5).each do |i| 
    Lab.create(lab_name: "Lab #{i}", lab_location: "Lab #{i} location")
end

(0..5).each do |i|
    Vendor.create(vendor_name: "Vendor #{i}",
                  location: "Vendor #{i} location",
                  email: "vendor#{i}@vendor",
                  website: "vendor#{i}.com",
                  description: "Vendor #{i} description")
    end

(0..5).each do |i|
    Category.create(category_name: "Category #{i}",
                    category_description: "Category #{i} description")
    end

(0..10).each do |i|

    Instrument.create(
                    instrument_name: "Instrument #{i}",
                    manufacturing_year: 2020 + i,
                    number_of_devices: i,
                    description: "Instrument #{i} description",
                    price: 1000 * i,
                    model: "model #{i}",
                    lab_id: Lab.first.id,
                    category_id: Category.first.id,
                    vendor_id: Vendor.first.id,
    )
end
