class Order < ApplicationRecord
  require 'csv'
  belongs_to :delivery_boy, optional: true
  #This method will call from orders.csv
  def self.custom_csv 
    CSV.generate do |csv|
      csv << ["id", "name", "address", "delivery_status", "customer_name", "delivery_reason"]
      all.each do |order|
        csv << [order.id, order.name, order.address, order.delivery_status, order.customer_name, order.delivery_reason]
        delivery_boy_fields = %w{id name number address}
        @db = order.delivery_boy
        csv << delivery_boy_fields
        csv << [@db.name, @db.number, @db.address]
      end
    end
  end
end
