class Activity < ApplicationRecord
  belongs_to :device
  belongs_to :driver, :optional => true
  belongs_to :user, :optional => true

  def danger?
    self.kind.include? "stuck" or self.kind.include? "reject"
  end

  def success?
    self.kind.include? "complete" or self.kind.include? "accepted"
  end
end
