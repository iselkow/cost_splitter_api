require 'rails_helper'

RSpec.describe Person, type: :model do
  subject { described_class.new(name: 'Isaac') }

  context 'associations' do
    it { should have_many(:person_expense_records) }
    it { should have_many(:expenses).through(:person_expense_records) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end
