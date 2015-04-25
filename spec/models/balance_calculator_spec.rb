require 'rails_helper'

RSpec.describe BalanceCalculator, type: :model do
  subject { described_class }

  context '.call' do
    context 'in the aggregate' do
      let(:result) { subject.call }
      let!(:person_1) { FactoryGirl.create(:person) }

      context 'with one person' do
        let!(:expense_1) { FactoryGirl.create(:expense, :communal, purchaser: person_1, cost: 10) }

        it 'has zero balance' do
          expect(result).to eq({ person_1.id => 0 })
        end
      end

      context 'with multiple people and one purchase' do
        let!(:person_2) { FactoryGirl.create(:person) }
        let!(:expense_1) { FactoryGirl.create(:expense, :communal, purchaser: person_1, cost: 10) }

        it 'has a balance of half the cost' do
          expect(result).to eq({ person_1.id => 5,
                                 person_2.id => -5 })
        end
      end

      context 'with multiple people and one purchaser' do
        let!(:person_2) { FactoryGirl.create(:person) }
        let!(:person_3) { FactoryGirl.create(:person) }
        let!(:expense_1) { FactoryGirl.create(:expense, :communal, purchaser: person_1, cost: 12) }

        it 'has a distributed balance' do
          expect(result).to eq( { person_1.id => 8,
                                  person_2.id => -4,
                                  person_3.id => -4 })
        end
      end

      context 'with multiple purchasers' do
        let!(:person_2) { FactoryGirl.create(:person) }
        let!(:person_3) { FactoryGirl.create(:person) }
        let!(:expense_1) { FactoryGirl.create(:expense, :communal, purchaser: person_1, cost: 12) }
        let!(:expense_2) { FactoryGirl.create(:expense, :communal, purchaser: person_2, cost: 15) }

        it 'has a distributed balance' do
          expect(result).to eq( { person_1.id => 3,
                                  person_2.id => 6,
                                  person_3.id => -9 })
        end
      end
    end

    context 'for an individual' do
      let(:result) { subject.call(person) }
      let!(:person) { FactoryGirl.create(:person) }
      let!(:expense) { FactoryGirl.create(:expense, :communal, purchaser: person, cost: 10) }

      it 'returns one balance' do
        expect(result).to eq(0)
      end
    end
  end
end
