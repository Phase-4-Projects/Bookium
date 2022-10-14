class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :city, :state, :image, :read, :currently_reading, :want_to_read, :events, :event_hostings, :user_events, :books
  has_many :user_books
  has_many :user_events
  has_many :books, through: :user_books
  has_many :events, through: :user_events
  has_many :event_hostings, {class_name: 'Event', foreign_key: 'host_id' }
  attribute :read do
    object.user_books.select do |user_book|
      user_book.status == "read"
    end
  end

  attribute :currently_reading do
    object.user_books.select do |user_book|
      user_book.status == "currently reading"
    end
  end

  attribute :want_to_read do
    object.user_books.select do |user_book|
      user_book.status == "want to read"
    end
  end
end