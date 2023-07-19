class Lab < ApplicationRecord
    has_many :instrument_labs, dependent: :delete_all
    has_many :instruments, through: :instrument_labs
end
