class VendorSerializer < ActiveModel::Serializer
  attributes :id, :vendor_name, :location, :email, :website, :description
end
