require 'rails_helper'

RSpec.describe Neighborhood, type: :model do
  subject do
    described_class.new(name: 'District Area',
                        longitude: -6.7708938,
                        latitude: 107.4988201,
                        criteria: 120.5)
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
    it 'is not valid without a criteria' do
      subject.criteria = nil
      expect(subject).to_not be_valid
    end
  end
end
