class User < ApplicationRecord
    has many book club users
    has many comments
end
