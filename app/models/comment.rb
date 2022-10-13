class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :comment, {presence: true}
  validates :user_id, {presence: true}
  validates :question_id, {presence: true}
end
