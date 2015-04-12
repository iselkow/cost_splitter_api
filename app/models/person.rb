class Person < ActiveRecord::Base
  has_many :person_expense_records
  has_many :expenses, through: :person_expense_records

  validates_presence_of :name
end
