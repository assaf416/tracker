class Package < ApplicationRecord
  belongs_to :driver
  belongs_to :ride
  belongs_to :passenger
  has_many :attachments

  scope :delivered, -> { where("dropped_at is not null") }
  scope :pending, -> { where("picked_at is not null and dropped_at is null") }

  def picked_up
    a = Activity.create(:ride_id => self.id,
                        :ride_id => self.ride_id,
                        :fleet_id => self.ride.fleet_id,
                        :driver_id => self.ride.driver_id,
                        :package_id => self.id,
                        :level => "info",
                        :kind => "package-pickup",
                        :message => "Package picked up ",
                        :created_at => Time.now)
  end

  def dropped_off
    a = Activity.create(:ride_id => self.id,
                        :ride_id => self.ride_id,
                        :fleet_id => self.ride.fleet_id,
                        :driver_id => self.ride.driver_id,
                        :package_id => self.id,
                        :level => "info",
                        :kind => "package-drop-off",
                        :message => "Package dropped  ",
                        :created_at => Time.now)
  end

  def qr_scan
    a = Activity.create(:ride_id => self.id,
                        :ride_id => self.ride_id,
                        :fleet_id => self.ride.fleet_id,
                        :package_id => self.id,
                        :driver_id => self.ride.driver_id,
                        :level => "info",
                        :kind => "package-qr-scan",
                        :message => "Package QRCODE  ",
                        :created_at => Time.now)
  end
end
