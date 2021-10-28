require 'rails_helper'

RSpec.describe Flat, type: :model do
  subject do
    described_class.new(name: 'Flat B',
                        address: 'Flower Street',
                        longitude: -6.7708939,
                        latitude: 107.4988201)
  end

  describe 'Validations' do
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a longitude' do
      subject.longitude = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a latitude' do
      subject.latitude = nil
      expect(subject).to_not be_valid
    end
  end
end
