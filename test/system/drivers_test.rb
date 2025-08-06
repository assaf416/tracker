require "application_system_test_case"

class DriversTest < ApplicationSystemTestCase
  setup do
    @driver = drivers(:one)
  end

  test "visiting the index" do
    visit drivers_url
    assert_selector "h1", text: "Drivers"
  end

  test "should create driver" do
    visit drivers_url
    click_on "New driver"

    fill_in "Device", with: @driver.device_id
    fill_in "Last location", with: @driver.last_location
    fill_in "Last message", with: @driver.last_message
    fill_in "Locationed at", with: @driver.locationed_at
    fill_in "Name", with: @driver.name
    fill_in "Starts at", with: @driver.starts_at
    click_on "Create Driver"

    assert_text "Driver was successfully created"
    click_on "Back"
  end

  test "should update Driver" do
    visit driver_url(@driver)
    click_on "Edit this driver", match: :first

    fill_in "Device", with: @driver.device_id
    fill_in "Last location", with: @driver.last_location
    fill_in "Last message", with: @driver.last_message
    fill_in "Locationed at", with: @driver.locationed_at.to_s
    fill_in "Name", with: @driver.name
    fill_in "Starts at", with: @driver.starts_at.to_s
    click_on "Update Driver"

    assert_text "Driver was successfully updated"
    click_on "Back"
  end

  test "should destroy Driver" do
    visit driver_url(@driver)
    click_on "Destroy this driver", match: :first

    assert_text "Driver was successfully destroyed"
  end
end
