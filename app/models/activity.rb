class Activity < ApplicationRecord
  belongs_to :device, :optional => true
  belongs_to :user, :optional => true
  belongs_to :driver, :optional => true
  belongs_to :ride, :optional => true

  scope :info, -> { where("level = ?", "info") }
  scope :warnings, -> { where("level = ?", "warning") }
  scope :errors, -> { where("level = ?", "error") }
  scope :alerts, -> { where("level = ?", "alert") }
  scope :with_locations, -> { where("lat is not null and longt is not null") }
  scope :driver_activities, -> { where("driver_id is not null") }
  scope :driver_activities, -> { where("driver_id is not null") }
  scope :passenger_activities, -> { where("passenger_id is not null") }
  scope :ride_activities, -> { where("ride_id is not null") }

  def self.device_location_message_at(id, lat, longt, time)
    location = "#{longt}:#{lat}"
    a = Activity.create(:device_id => id,
                        :level => "info",
                        :kind => "device-location",
                        :message => "Location is #{location}",
                        :lat => lat, :longt => longt,
                        :location => location, :created_at => time)
  end
  def self.device_geofence_alert(id, lat, longt, time)
    location = "#{longt}:#{lat}"
    a = Activity.create(:device_id => id,
                        :level => "alert",
                        :kind => "device-geofence-alert",
                        :message => "Geofence Alert at #{location}",
                        :lat => lat, :longt => longt,
                        :location => location, :created_at => time)
  end

  def self.ride_started(id, lat, longt, time)
    location = "#{longt}:#{lat}"
    a = Activity.create(:ride_id => id,
                        :level => "info",
                        :kind => "ride-started",
                        :lat => lat, :longt => longt,
                        :location => location, :created_at => time)
  end
  def self.ride_cancelled(id, lat, longt, time)
    location = "#{longt}:#{lat}"
    a = Activity.create(:ride_id => id,
                        :level => "info",
                        :kind => "ride-cancelled",
                        :lat => lat, :longt => longt,
                        :location => location, :created_at => time)
  end

  def self.ride_completed(id, lat, longt, time)
    location = "#{longt}:#{lat}"
    a = Activity.create(:ride_id => id,
                        :level => "info",
                        :kind => "ride-completed",
                        :lat => lat, :longt => longt,
                        :location => location, :created_at => time)
  end
  def self.ride_picked_up(id, lat, longt, time)
    location = "#{longt}:#{lat}"
    a = Activity.create(:ride_id => id,
                        :level => "info",
                        :kind => "ride-pickup",
                        :lat => lat, :longt => longt,
                        :location => location, :created_at => time)
  end
  def self.ride_delivered(id, lat, longt, time)
    location = "#{longt}:#{lat}"
    a = Activity.create(:ride_id => id,
                        :level => "info",
                        :kind => "ride-delivery",
                        :lat => lat, :longt => longt,
                        :location => location, :created_at => time)
  end
end
