class User < ApplicationRecord
    has_many :user_events, dependent: :delete_all

    validates :email, presence: true
end
