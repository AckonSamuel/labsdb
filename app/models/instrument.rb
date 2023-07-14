class Instrument < ApplicationRecord
    has_many_attached :instrument_photos
    has_many  :instrument_categories, dependent: :delete_all
    has_many :categories, through: :instrument_categories
    has_many :instrument_labs, dependent: :delete_all
    has_many :labs, through: :instrument_labs

    def instrument_photos_url
        return [] 
        # unless instrument_photos.attached?

        # instrument_photos.attachments.map(&:url)
    end
end
