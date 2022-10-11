class BookClubUser < ApplicationRecord
    belongs_to :users
    belongs_to :book_club
end
