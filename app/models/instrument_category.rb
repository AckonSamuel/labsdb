class InstrumentCategory < ApplicationRecord
  belongs_to :instrument
  belongs_to :category
end
