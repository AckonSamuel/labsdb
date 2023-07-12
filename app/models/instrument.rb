class Instrument < ApplicationRecord
    has_many_attached :instrument_photos, dependent: :destroy
    has_many :instrument_categories
    has_many :categories, through: :instrument_categories
    has_many :instrument_labs
    has_many :labs, through: :instrument_labs

    def instrument_photos_url
        return [] unless instrument_photos.attached?

        instrument_photos.attachments.map(&:url)
    end
end
