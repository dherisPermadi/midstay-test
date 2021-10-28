# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password validations: false

  attr_accessor :password_digest, :change_password, :password_confirmation,
                :current_password

  belongs_to :flat

  before_create :set_encrypted_password
  before_update :set_encrypted_password, if: -> { change_password.present? }

  validates :password, presence: true, on: :create
  validates :password, :password_confirmation, :current_password,
            presence: true, if: -> { change_password.present? }
  validates :email, :name, :phone_number, presence: true, uniqueness: { case_sensitive: false }
  validate :password_validation, on: :update, if: -> { change_password.present? }

  def set_encrypted_password
    self.encrypted_password = password_digest
  end

  def password_validation
    return unless password.present? && password_confirmation.present? &&
                  current_password.present?

    errors.add :base, 'Password is wrong' unless test_password
    errors.add :base, 'New Password and Password Confirmation is not match' if password_confirmation != password
  end

  def test_password
    BCrypt::Password.new(encrypted_password) == current_password
  end
end
