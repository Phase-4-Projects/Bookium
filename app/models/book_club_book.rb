class BookClubBook < ApplicationRecord
  belongs_to :bookclub
  belongs_to :book
  has_many :goals, dependent: :destroy
  has_many :questions, dependent: :destroy
end
