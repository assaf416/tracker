class Message < ApplicationRecord
  belongs_to :fleet
  belongs_to :user
end
