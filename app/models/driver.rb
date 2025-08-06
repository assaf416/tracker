class Driver < ApplicationRecord
  belongs_to :fleet
  has_many :messages
  has_many :rides
  has_many :activities
  has_many :attachments

  has_one_attached :avatar

  include ApplicationHelper

  # driver commands

  def started_shift
    a = Activity.create(:driver_id => self.id,
                        :level => "command",
                        :kind => "driver-started-shift",
                        :message => "Driver stated shift",
                        :created_at => Time.now)
  end

  def ended_shift
    a = Activity.create(:driver_id => self.id,
                        :level => "command",
                        :kind => "driver-ended-shift",
                        :message => "Driver Ended shift",
                        :created_at => Time.now)
  end

  def send_text_message(message)
    a = Activity.create(:driver_id => self.id,
                        :level => "command",
                        :kind => "driver-message",
                        :message => message,
                        :created_at => Time.now)
  end

  def accepted_ride(ride)
    a = Activity.create(:driver_id => self.id,
                        :level => "command",
                        :kind => "driver-accepted-ride",
                        :message => ride.id,
                        :created_at => Time.now)
  end

  def reject_ride(ride)
    a = Activity.create(:driver_id => self.id,
                        :level => "command",
                        :kind => "driver-rejected-ride",
                        :message => ride.id,
                        :created_at => Time.now)
  end

  def upload_picture(url)
    a = Activity.create(:driver_id => self.id,
                        :level => "command",
                        :kind => "driver-upload-picture",
                        :message => message,
                        :created_at => Time.now)
  end

  def load_test_locations
    list = JSON.parse(File.read("docs/unit_locations.json"))
    for item in list
      location_message_at(self.id, item["lat"], item["long"], item["created_at"])
    end
  end
end
