class InstrumentSerializer < ActiveModel::Serializer
  attributes :id, :instrument_name, :manufacturing_year, :number_of_devices, :description, :price, :model
end
