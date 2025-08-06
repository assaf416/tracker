class Device < ApplicationRecord
  belongs_to :user
  belongs_to :fleet
  has_many :messages
  has_many :activities
  has_many :attachments

  include ApplicationHelper

  def location
    # fake_location
  end

  #device commands
  def request_status
    a = Activity.create(:device_id => self.id,
                        :fleet_id => self.fleet_id,
                        :level => "command",
                        :kind => "device-req-status",
                        :message => "Reuqesting unit status",
                        :created_at => Time.now)
  end

  def set_geofence(lat, long, radius)
    a = Activity.create(:device_id => self.id,
                        :fleet_id => self.fleet_id,
                        :level => "command",
                        :kind => "device-set-geofence",
                        :message => "Setting geofence of 10m around #{location}",
                        :created_at => Time.now)
  end

  def cancel_geofence(lat, long, radius)
    a = Activity.create(:device_id => self.id,
                        :fleet_id => self.fleet_id,
                        :level => "command",
                        :kind => "device-cancel-geofence",
                        :message => "Cancel geofence of 10m around #{location}",
                        :created_at => Time.now)
  end

  def take_photo
    a = Activity.create(:device_id => self.id,
                        :fleet_id => self.fleet_id,
                        :level => "command",
                        :kind => "device-take-photo",
                        :message => "Requst device to take a camera picture",
                        :created_at => Time.now)
  end

  def take_video
    a = Activity.create(:device_id => self.id,
                        :fleet_id => self.fleet_id,
                        :level => "command",
                        :kind => "device-take-video",
                        :message => "Requst device to take a camera picture",
                        :created_at => Time.now)
  end

  def take_heart_beats
    a = Activity.create(:device_id => self.id,
                        :fleet_id => self.fleet_id,
                        :level => "command",
                        :kind => "device-take-heart-beat",
                        :message => "Requst device to take a camera picture",
                        :created_at => Time.now)
  end

  def mute_microphone
    a = Activity.create(:device_id => self.id,
                        :level => "command",
                        :fleet_id => self.fleet_id,
                        :kind => "device-mute-microphone",
                        :message => "Requst device to take a camera picture",
                        :created_at => Time.now)
  end

  def load_test_locations
    list = JSON.parse(File.read("docs/unit_locations.json"))
    for item in list
      location_message_at(self.id, item["longt"], item["lat"], item["created_at"])
    end
  end
end
