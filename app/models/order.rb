class Order < ApplicationRecord
  belongs_to :delivery_boy, optional: true
end
