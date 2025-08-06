# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

include ApplicationHelper

puts "CREATE USERS"

User.create(:name => "אסף ", :email => "assaf.goldstein@gmail.com", :image_url => "/assets/face1.jpg", :password => "demo123", :password_confirmation => "demo123")

DeviceKind.create(:name => "GPS mini board", :price => "49$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/S23aa364baa7e4fb8a175b0683160276dl.jpg_220x220q75.jpg_.avif")
DeviceKind.create(:name => "GPS Watch 1", :price => "99$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/Sd0cad8264f034d6da984599b08b255320.jpg_220x220q75.jpg_.avif")
DeviceKind.create(:name => "GPS Watch 2", :price => "199$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/Sb13c3b25115a4afe9acbde39ac93bb8fT.jpg_220x220q75.jpg_.avif")
DeviceKind.create(:name => "KaiOS ", :price => "199$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/Sb13c3b25115a4afe9acbde39ac93bb8fT.jpg_220x220q75.jpg_.avif")
DeviceKind.create(:name => "Car Module ", :price => "299$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/HTB16WDUMNjaK1RjSZFAq6zdLFXa8.jpg_220x220q75.jpg_.avif")
DeviceKind.create(:name => "DRONE KIT", :price => "399$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/Sab318d58819e47b9b0bcf6c92fdd09c8e.jpg_220x220q75.jpg_.avif")
DeviceKind.create(:name => "Car Camera Module", :price => "399$", :image_url => "https://img.kwcdn.com/product/fancy/99251a74-5e41-4164-b92e-77919f37965f.jpg?imageView2/2/w/800/q/70/format/webp")
DeviceKind.create(:name => "Dog / Cat Collar", :price => "399$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/S08d0b539ccb34b74957d108dbef563efj.jpg_220x220q75.jpg_.avif")
DeviceKind.create(:name => "Android Phone", :price => "399$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/S08d0b539ccb34b74957d108dbef563efj.jpg_220x220q75.jpg_.avif")
DeviceKind.create(:name => "Android Car display", :price => "399$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/S86f21404f314488ebef6a11886bd867fE.jpg_220x220q75.jpg_.avif")
DeviceKind.create(:name => "Android Car display II", :price => "399$", :image_url => "https://ae-pic-a1.aliexpress-media.com/kf/S087e830a1d654fe9bc1a423fdd5bbda5m.jpg_220x220q75.jpg_.avif")

for u in User.all
  fleet = Fleet.create(:user_id => u.id, :name => "Fleet of #{u.name}")

  puts "CREATE Devices"
  30.times do
    kind = DeviceKind.all.sample(1)[0]
    d = Device.create(:fleet_id => fleet.id, :user_id => u.id, :name => Faker::Name.name, :kind => kind.name, :device_kind_id => kind.id, :ssid => "ABX#{rand(100000)}")
    d.load_test_locations
  end

  puts "CREATE Drivers"
  5.times do
    name = Faker::Name.name
    d = Driver.create(:fleet_id => fleet.id, :name => name, :image_url => fake_user_image_url, :status => ["Off Shift", "On Shift", "Vacant", "Ride", "Error", "Delivered"].sample(1)[0])
    d.load_test_locations
  end
  puts "CREATE Passengers"
  5.times do
    name = Faker::Name.name
    Passenger.create(:name => name,
                     :fleet_id => fleet.id,
                     :image_url => fake_user_image_url,
                     :status => ["off_the_car", "in_the_car"].sample(1)[0])
  end

  puts "CREATE Rides"
  addresses = ["הגפן 4 קרית גת", "צהל 24 כפר אזר", "דרור 50 ראשון לציון", "אידמית 6 גבעתיים"]
  sel_addresses = addresses.sample(2)
  2.times do
    driver = Driver.all.sample(1)[0]
    Ride.create(:driver_id => driver.id,
                :fleet_id => fleet.id,
                :from_address => sel_addresses[0],
                :to_address => sel_addresses[1],
                :status => ["Off Shift", "On Shift", "Vacant", "Ride", "Error", "Delivered"].sample(1)[0])
  end

  # LOCATION AND GEOFENCES
  location = fake_location

  Location.create(:fleet_id => fleet.id, :name => "My house", :kind => "location", :category => "Favorites", :lat => location[:lat], :longt => location["long"])
  Location.create(:fleet_id => fleet.id, :name => "Geofence Around My  house", :kind => "geofence", :category => "Favorites", :lat => location[:lat], :longt => location["long"], :radius_in_meters => 100)
  Location.create(:fleet_id => fleet.id, :name => "Bus stop #1", :kind => "bus-stop", :category => "Favorites", :lat => location[:lat], :longt => location["long"], :radius_in_meters => 100)
  Location.create(:fleet_id => fleet.id, :name => "Bus stop #2", :kind => "bus-stop", :category => "Favorites", :lat => location[:lat], :longt => location["long"], :radius_in_meters => 100)
  Location.create(:fleet_id => fleet.id, :name => "Bus stop #3", :kind => "bus-stop", :category => "Favorites", :lat => location[:lat], :longt => location["long"], :radius_in_meters => 100)
end
