require 'rails_helper'

RSpec.describe PersonExpenseRecord, type: :model do
  subject { described_class.new }

  context 'associations' do
    it { should belong_to(:person) }
    it { should belong_to(:expense) }
  end

  context 'validations' do
    it { should validate_presence_of(:person) }
    it { should validate_presence_of(:expense) }
  end
end
