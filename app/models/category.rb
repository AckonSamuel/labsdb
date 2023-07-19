class Category < ApplicationRecord 
    has_many :instrument_categories, dependent: :delete_all
    has_many :instruments, through: :instrument_categories
end
