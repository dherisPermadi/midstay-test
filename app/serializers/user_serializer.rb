# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :flat, :created_at, :updated_at

  def flat
    flat = object.try(:flat)

    return unless flat.present?

    FlatSerializer.new(flat)
  end
end
