# frozen_string_literal: true

class Neighborhood < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :latitude, :longitude, :criteria, presence: true

  geocoded_by :address

  def flats
    Flat.near([latitude, longitude], criteria)
  end
end
