class Author < ApplicationRecord
  # has_many :books, dependent: :destroy, before_add: [:check_book_limit, :second_method]
  
  has_many :books, -> { order 'price desc' }, dependent: :destroy
  validates_presence_of :name
  #after_add: :after_method, before_add: :befor_method, before_remove: :before_remove_method, after_remove: :after_remove_method
  
  has_one :author_detail, touch: true , dependent: :destroy#, after_add: :check_author_detail_for_hasone #not working
  # before_create :check_book_limit_for_create
  # has_many :books, inverse_of:\ 'writer' # working
  # has_many :, inverse_of: 'writer' # working
  accepts_nested_attributes_for :books
  accepts_nested_attributes_for :author_detail
  def befor_method(b)
    puts "----------------------------------"
    puts "this is before_add from model check_book_limit"
    puts self.books.size
    puts "----------------------------------"
    # if self.books.size > 7
    #   puts "this is #{b.as_json}"
    #   self.books.first.destroy
    # end
  end
  def after_method(b)
    puts "----------------------------------"
    puts "second method of associated callback"
    puts self.books.size
    puts "----------------------------------"
  end

  def before_remove_method(b)
    puts "----------------------------------"
    puts "this is befor_remove_method"
    puts b.as_json
    puts self.books.size
    puts "----------------------------------"
  end
  def after_remove_method(obj)
    puts "----------------------------------"
    puts "this is after_remove_method"
    puts obj.as_json
    puts self.books.size
    puts "----------------------------------"
  end

  def check_author_detail_for_hasone
    puts "----------------------------------"
    puts "this is after_remove_method"
    puts obj.as_json
    puts self.books.size
    puts "----------------------------------"
  end


  def check_book_limit_for_create
    puts "----------------------------------"
    puts "this is before_add from model check_book_limit"
    # 1puts self.name = "default_author"
    # self.save
    puts "----------------------------------"
  end

  # After association callback
  def check_author_detail(authordetail)
    puts "----------------------"
    puts  authordetail.as_json
    puts "----------------------"
  end
end

# has_many :books, -> { extending Addmethod } , dependent: :destroy, 
#   after_add: :after_method, before_add: :befor_method, before_remove: :before_remove_method, after_remove: :after_remove_method

#  has_many :books, ->{ where "price < 500"}
#  has_many :books, ->{ where "price < 500"}
#  has_many :books, ->{ order 'price asc'}
#  has_many :books,-> { order('price desc').limit(5) }
#  has_many :books,-> { order('price desc').offset(2) }
#  has_many :books, -> { select 'id title, price' }