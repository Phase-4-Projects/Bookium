class User < ApplicationRecord
    has_secure_password
    validates :email, {presence: true, uniqueness: true}
    
    
    has_many :book_club_users
    has_many :comments
end
