class Instrument < ApplicationRecord
    has_many_attached :instrument_photos
    has_many :instrument_categories, dependent: :delete_all
    has_many :categories, through: :instrument_categories
    has_many :instrument_labs, dependent: :delete_all
    has_many :labs, through: :instrument_labs
  
    def instrument_photos_url
      with_active_storage_url_options do
        self.instrument_photos.map { |photo| photo.url }
      end
    end
  
    private
  
    def with_active_storage_url_options(&block)
      original_url_options = ActiveStorage::Current.url_options
      ActiveStorage::Current.url_options = { host: "https://labsdb.s3.amazonaws.com" }
      yield
    ensure
      ActiveStorage::Current.url_options = original_url_options
    end
  end
  