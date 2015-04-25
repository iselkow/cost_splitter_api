class BalanceCalculator
  def self.call(target=nil)
    balances = {}

    # Set default balance to 0
    Person.find_each { |person| balances[person.id] = 0 }

    # Iterate over each expense
    Expense.find_each do |expense|

      # Increase the balance by the total cost for the purchaser
      balances[expense.purchaser_id] += expense.cost

      # Collect the number of users
      payer_list = expense.people.map { |person| person.id }
      payer_count = payer_list.length

      # Calculate share per user
      share_per_user = expense.cost / payer_count

      # Update balance for each user
      payer_list.each { |payer_id| balances[payer_id] -= share_per_user }
    end

    target ? balances[target.id] : balances
  end
end
