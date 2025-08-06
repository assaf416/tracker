require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "should create activity" do
    visit activities_url
    click_on "New activity"

    fill_in "Device", with: @activity.device_id
    fill_in "Driver", with: @activity.driver_id
    fill_in "Heading", with: @activity.heading
    fill_in "Level", with: @activity.level
    fill_in "Location", with: @activity.location
    fill_in "Message", with: @activity.message
    fill_in "Ride", with: @activity.ride_id
    fill_in "Settings", with: @activity.settings
    fill_in "Speed", with: @activity.speed
    fill_in "Status", with: @activity.status
    fill_in "User", with: @activity.user_id
    click_on "Create Activity"

    assert_text "Activity was successfully created"
    click_on "Back"
  end

  test "should update Activity" do
    visit activity_url(@activity)
    click_on "Edit this activity", match: :first

    fill_in "Device", with: @activity.device_id
    fill_in "Driver", with: @activity.driver_id
    fill_in "Heading", with: @activity.heading
    fill_in "Level", with: @activity.level
    fill_in "Location", with: @activity.location
    fill_in "Message", with: @activity.message
    fill_in "Ride", with: @activity.ride_id
    fill_in "Settings", with: @activity.settings
    fill_in "Speed", with: @activity.speed
    fill_in "Status", with: @activity.status
    fill_in "User", with: @activity.user_id
    click_on "Update Activity"

    assert_text "Activity was successfully updated"
    click_on "Back"
  end

  test "should destroy Activity" do
    visit activity_url(@activity)
    click_on "Destroy this activity", match: :first

    assert_text "Activity was successfully destroyed"
  end
end
