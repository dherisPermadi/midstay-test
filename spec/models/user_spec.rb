require 'rails_helper'

RSpec.describe User, type: :model do
  let(:flat) do
    Flat.create(name: 'Flat Test', address: 'Flower Street',
                longitude: -6.7708939, latitude: 107.4988201)
  end
  subject do
    described_class.new(email: 'john@doe.com',
                        password: 'Password123',
                        phone_number: 'phone_number',
                        name: 'John',
                        flat_id: flat.id)
  end

  describe 'association' do
    it { should belong_to(:flat).class_name('Flat') }
  end

  describe 'Validations' do
    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a phone number' do
      subject.phone_number = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
