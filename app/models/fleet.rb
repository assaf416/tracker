class Fleet < ApplicationRecord
  has_many :devices
  has_many :rides
  has_many :drivers
  has_many :passengers
  has_many :packages
  has_many :messages
  has_many :activities
  has_many :tickets
  has_many :attachments
end
