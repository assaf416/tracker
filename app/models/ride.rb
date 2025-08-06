class Ride < ApplicationRecord
  belongs_to :driver
  belongs_to :fleet
  has_many :activities
  has_many :passengers
  has_many :attachments

  after_create :set_location_and_direction

  scope :with_locations, -> { where("from_address is not null and to_address is not null") }
  scope :with_price, -> { where("price > 0 or tax > 0") }
  scope :completed, -> { where("completed_at is not null") }
  scope :started, -> { where("started_at is not null") }
  scope :in_progress, -> { where("strated_at is not null and  completed_at is null") }
  scope :future, -> { where("starts_at > ?", Time.now) }
  scope :accepted, -> { where("accpeted_at is not null") }
  scope :vacant, -> { where("accpeted_at is null") }
  scope :deliveries, -> { where("dropped_at is not null") }

  def set_location_and_direction
    client = OpenStreetMap::Client.new
    from_location = client.search(q: self.from_address, format: "json", addressdetails: "1", accept_language: "il")
    to_location = client.search(q: self.to_address, format: "json", addressdetails: "1", accept_language: "il")

    puts "FROM LOCATION:"
    puts from_location[0].inspect
    puts "TO LOCATION:"
    puts to_location[0].inspect
    self.from_lat = from_location[0].inspect["lat"]
    self.from_longt = from_location[0].inspect["lon"]
    self.to_lat = to_location[0].inspect["lat"]
    self.to_longt = to_location[0].inspect["lon"]
    self.save
  end

  def name
    "#{self.from_address} - #{self.to_address}"
  end

  def distance
    rand(30)
  end

  def started_ride
    a = Activity.create(:ride_id => self.id,
                        :level => "info",
                        :kind => "ride-start",
                        :message => "Ride is starting",
                        :created_at => Time.now)
  end

  def completed_ride
    a = Activity.create(:ride_id => self.id,
                        :level => "info",
                        :fleet_id => self.fleet_id,
                        :kind => "ride-completed",
                        :message => "Ride is completed",
                        :created_at => Time.now)
  end

  def pickup_passenger(passeger)
    a = Activity.create(:ride_id => self.id,
                        :level => "info",
                        :fleet_id => self.fleet_id,
                        :kind => "ride-pickup-passenger",
                        :message => "Picking up passenger",
                        :created_at => Time.now)
  end

  def drop_passenger(passeger)
    a = Activity.create(:ride_id => self.id,
                        :level => "info",
                        :fleet_id => self.fleet_id,
                        :kind => "ride-drop-passenger",
                        :message => "Picking up passenger",
                        :created_at => Time.now)
  end
end
