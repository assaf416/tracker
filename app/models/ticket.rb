class Ticket < ApplicationRecord
  belongs_to :fleet, :optional => true
  belongs_to :user, :optional => true
  belongs_to :driver, :optional => true
  belongs_to :ride, :optional => true

  def name
    self.user.name
  end
end
