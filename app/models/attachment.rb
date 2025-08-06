class Attachment < ApplicationRecord
  belongs_to :fleet
  belongs_to :driver, :optional => true
  belongs_to :ride, :optional => true
  belongs_to :package, :optional => true
  belongs_to :user, :optional => true
  belongs_to :passenger, :optional => true
  belongs_to :device, :optional => true
  has_one_attached :file
end
