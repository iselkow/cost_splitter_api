class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :cost, precision: 8, scale: 2
      t.string :description

      t.timestamps null: false
    end
  end
end
