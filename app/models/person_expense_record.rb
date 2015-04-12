class PersonExpenseRecord < ActiveRecord::Base
  belongs_to :person
  belongs_to :expense

  validates_presence_of :person
  validates_presence_of :expense
end
