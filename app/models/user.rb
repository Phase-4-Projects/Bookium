class User < ApplicationRecord
    has_many :book_club_users
    has_many :comments
end
