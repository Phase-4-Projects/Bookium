class Question < ApplicationRecord
    belongs_to :book_club_book
    has_many :comments
end
