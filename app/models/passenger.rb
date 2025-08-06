class Passenger < ApplicationRecord
  belongs_to :ride, :optional => true
  belongs_to :fleet, :optional => true
  has_many :attachments

  has_one_attached :avatar

  include ApplicationHelper

  def register_to_ride
    a = Activity.create(:ride_id => self.id,
                        :level => "info",
                        :fleet_id => self.ride.fleet_id,
                        :kind => "passenger-register",
                        :message => "Ride is starting",
                        :created_at => Time.now)
  end

  def unregister_from_ride
    a = Activity.create(:ride_id => self.id,
                        :level => "info",
                        :fleet_id => self.ride.fleet_id,
                        :kind => "passenger-unregister",
                        :message => "Ride is starting",
                        :created_at => Time.now)
  end

  def picked_up
    a = Activity.create(:ride_id => self.id,
                        :level => "info",
                        :kind => "passenger-picked-up",
                        :message => "Ride is starting",
                        :created_at => Time.now)
  end

  def dropped_off
    a = Activity.create(:ride_id => self.id,
                        :level => "info",
                        :kind => "passenger-dropped-off",
                        :message => "Ride is starting",
                        :created_at => Time.now)
  end

  def approve
    a = Activity.create(:ride_id => self.id,
                        :level => "info",
                        :kind => "passenger-approve-ride",
                        :message => "Ride is starting",
                        :created_at => Time.now)
  end
end
