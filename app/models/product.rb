class Product < ApplicationRecord
  # has_many :pictures
  has_many :pictures, as: :imageable
  has_many :varients
  validates :creator, presence:{message: "can't blank"}
  def check_method(object)
    puts "this is association callback method=> before_add"
    puts object.as_json
  end
  # after_commit :bhadresh
  def bhadresh
    puts "=-=-=-=-=-=-=-=-=-=-=-"
    puts "=-=-=-=-=-=-=-=-=-=-=-"
    puts "=-=-=-=-=-=-=-=-=-=-=-"
    puts "=-=-=-=-=-=-=-=-=-=-=-"
    puts "=-=-=-=-=-=-=-=-=-=-=-"
    puts "=-=-=-=-=-=-=-=-=-=-=-"
    puts "=-=-=-=-=-=-=-=-=-=-=-"
    puts "=-=-=-=-=-=-=-=-=-=-=-"
  end
end
