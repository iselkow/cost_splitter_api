require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject { described_class.new(cost: 10.0, description: 'item') }

  context 'associations' do
    it { should have_many(:person_expense_records) }
    it { should have_many(:people).through(:person_expense_records) }
  end

  context 'validations' do
    it { should validate_presence_of(:cost) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:description) }
  end
end
