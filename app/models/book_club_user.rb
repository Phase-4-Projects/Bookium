class BookClubUser < ApplicationRecord
    belongs_to :users
    belongs_to :book_club

    validates :user_id, {presence: true }
    validates :bookclub_id, {presence: true }
end
