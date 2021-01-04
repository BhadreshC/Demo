class Product < ApplicationRecord
  # has_many :pictures
  has_many :pictures, as: :imageable
end

def check_method(object)
  puts "this is association callback method=> before_add"
  puts object.as_json
end
