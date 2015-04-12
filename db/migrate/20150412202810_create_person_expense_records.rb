class CreatePersonExpenseRecords < ActiveRecord::Migration
  def change
    create_table :person_expense_records do |t|
      t.belongs_to :person
      t.belongs_to :expense

      t.timestamps null: false
    end
  end
end
