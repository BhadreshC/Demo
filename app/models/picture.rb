class Picture < ApplicationRecord
  # belongs_to :employee
  # belongs_to :product
  belongs_to :imageable, polymorphic: true
end
