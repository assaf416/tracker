class Atcivity < ApplicationRecord
  belongs_to :device, :optional => true
  belongs_to :user, :optional => true
  belongs_to :driver, :optional => true
  belongs_to :ride, :optional => true
end
