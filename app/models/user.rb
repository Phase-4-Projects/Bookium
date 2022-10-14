class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :user_books
    has_many :user_events
    has_many :comments
    has_many :books, through: :user_books
    has_many :events, through: :user_events
    has_many :event_hostings, {class_name: 'Event', foreign_key: 'host_id' }
end