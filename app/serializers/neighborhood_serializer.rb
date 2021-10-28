# frozen_string_literal: true

class NeighborhoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :criteria, :flats, :created_at, :updated_at

  def flats
    flats = object.try(:flats)

    return unless flats.present?

    flats.map { |flat| FlatSerializer.new(flat, root: false) }
  end
end
