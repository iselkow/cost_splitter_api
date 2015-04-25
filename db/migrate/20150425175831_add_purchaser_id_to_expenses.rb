class AddPurchaserIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :purchaser_id, :integer
  end
end
