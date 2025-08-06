require "application_system_test_case"

class DevicesTest < ApplicationSystemTestCase
  setup do
    @device = devices(:one)
  end

  test "visiting the index" do
    visit devices_url
    assert_selector "h1", text: "Devices"
  end

  test "should create device" do
    visit devices_url
    click_on "New device"

    fill_in "Avatar", with: @device.avatar
    fill_in "Driver", with: @device.driver_id
    fill_in "Error", with: @device.error_id
    fill_in "Kind", with: @device.kind
    fill_in "Last location", with: @device.last_location
    fill_in "Last location at", with: @device.last_location_at
    fill_in "Model", with: @device.model
    fill_in "Name", with: @device.name
    fill_in "Recent message", with: @device.recent_message
    fill_in "Settings", with: @device.settings
    fill_in "Ssid", with: @device.ssid
    fill_in "System message", with: @device.system_message
    fill_in "Type", with: @device.type
    fill_in "User", with: @device.user_id
    click_on "Create Device"

    assert_text "Device was successfully created"
    click_on "Back"
  end

  test "should update Device" do
    visit device_url(@device)
    click_on "Edit this device", match: :first

    fill_in "Avatar", with: @device.avatar
    fill_in "Driver", with: @device.driver_id
    fill_in "Error", with: @device.error_id
    fill_in "Kind", with: @device.kind
    fill_in "Last location", with: @device.last_location
    fill_in "Last location at", with: @device.last_location_at.to_s
    fill_in "Model", with: @device.model
    fill_in "Name", with: @device.name
    fill_in "Recent message", with: @device.recent_message
    fill_in "Settings", with: @device.settings
    fill_in "Ssid", with: @device.ssid
    fill_in "System message", with: @device.system_message
    fill_in "Type", with: @device.type
    fill_in "User", with: @device.user_id
    click_on "Update Device"

    assert_text "Device was successfully updated"
    click_on "Back"
  end

  test "should destroy Device" do
    visit device_url(@device)
    click_on "Destroy this device", match: :first

    assert_text "Device was successfully destroyed"
  end
end
