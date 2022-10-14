class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :book_id, :content, :rating, :title
    belongs_to :book
    belongs_to :user
end