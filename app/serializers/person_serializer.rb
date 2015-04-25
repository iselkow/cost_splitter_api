class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :paid, :balance

  def balance
    object.try(:balance)
  end
end
