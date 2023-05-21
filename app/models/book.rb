class Book < ApplicationRecord
   has_one_attached :image
   belongs_to :user
 def index
   @book = Book.new
 end
end
