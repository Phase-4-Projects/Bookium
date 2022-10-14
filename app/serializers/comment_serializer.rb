class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :content, :created_at
  attribute :user do
    object.user
  end
  attribute :readable_time do
    object.created_at.strftime("%m/%d/%Y at %I:%M%p")
  end
  # attribute :sorted do
  #   Comment.all.sort { |a,b| b.created_at <=> a.created_at }
  # end
end