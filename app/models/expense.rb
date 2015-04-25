class Expense < ActiveRecord::Base
  has_many :person_expense_records
  has_many :people, through: :person_expense_records
  belongs_to :purchaser, foreign_key: 'purchaser_id', class_name: "Person"

  validates_presence_of :cost
  validates_presence_of :description
  validates_presence_of :purchaser
  validates_uniqueness_of :description
end
