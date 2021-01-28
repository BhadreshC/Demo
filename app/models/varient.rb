class Varient < ApplicationRecord
  belongs_to :product, counter_cache: true
end
