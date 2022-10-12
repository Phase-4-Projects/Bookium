class BookClubBook < ApplicationRecord
  belongs_to :bookclub
  belongs_to :book
  has_many :goals, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :book_id, {presence: true }
  validates :bookclub_id, {presence: true }
  validates :status, inclusion: { in: ['Not Started', 'In Progress', 'Finished']}
end
