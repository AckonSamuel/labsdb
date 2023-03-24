class Instrument < ApplicationRecord
    belongs_to :category
    has_one :instrumentdetail
    belongs_to :lab
    belongs_to :vendor
end
