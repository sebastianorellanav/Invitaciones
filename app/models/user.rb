class User < ApplicationRecord
    has_many :user_events

    validates :email, presence: true
end
