class Question < ApplicationRecord
    belongs_to :book_club_book
    has_many :comments, dependent: :destroy

    validates :bookclub_book_id, {presence: true }
    validates :question, {presence: true }
    validates :chapter, {presence: true }
    validates :chapter, numericality: true
end
