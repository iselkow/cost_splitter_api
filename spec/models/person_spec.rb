require 'rails_helper'

RSpec.describe Person, type: :model do
  subject { described_class.new(name: 'Isaac') }

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end
