class Expense < ActiveRecord::Base
  has_many :person_expense_records
  has_many :people, through: :person_expense_records

  validates_presence_of :cost
  validates_presence_of :description
  validates_uniqueness_of :description
end
