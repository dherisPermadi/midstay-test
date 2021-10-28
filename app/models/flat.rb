# frozen_string_literal: true

class Flat < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :latitude, :longitude, presence: true

  geocoded_by :address
end
