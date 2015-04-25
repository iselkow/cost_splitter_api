FactoryGirl.define do
  factory :expense do
    cost 5
    description { FFaker::Product.product }
    association :purchaser, factory: :person
  end

  trait :communal do
    after(:build) do |expense|
      Person.all.each do |p|
        FactoryGirl.create(:person_expense_record, expense: expense, person: p)
      end
    end
  end
end
