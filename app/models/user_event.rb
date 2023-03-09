class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :type_state
end
