class InstrumentSerializer < ActiveModel::Serializer
  attributes :id, :instrument_name, :manufacturing_year, :number_of_devices, :description, :price, :model, :labs, :categories

  def categories
    object.categories.pluck(:id)
  end

  def labs
    object.labs.pluck(:id)
  end
end
