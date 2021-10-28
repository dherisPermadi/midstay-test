# frozen_string_literal: true

class FlatSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :latitude, :longitude, :created_at, :updated_at
end
