class DeliveryBoy < ApplicationRecord
  has_many :orders, before_add: :assign_boy
  def assign_boy(order)
    order.delivery_status = "assign"
  end
end
