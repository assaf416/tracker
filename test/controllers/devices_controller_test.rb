require "test_helper"

class DevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @device = devices(:one)
  end

  test "should get index" do
    get devices_url
    assert_response :success
  end

  test "should get new" do
    get new_device_url
    assert_response :success
  end

  test "should create device" do
    assert_difference("Device.count") do
      post devices_url, params: { device: { avatar: @device.avatar, driver_id: @device.driver_id, error_id: @device.error_id, kind: @device.kind, last_location: @device.last_location, last_location_at: @device.last_location_at, model: @device.model, name: @device.name, recent_message: @device.recent_message, settings: @device.settings, ssid: @device.ssid, system_message: @device.system_message, type: @device.type, user_id: @device.user_id } }
    end

    assert_redirected_to device_url(Device.last)
  end

  test "should show device" do
    get device_url(@device)
    assert_response :success
  end

  test "should get edit" do
    get edit_device_url(@device)
    assert_response :success
  end

  test "should update device" do
    patch device_url(@device), params: { device: { avatar: @device.avatar, driver_id: @device.driver_id, error_id: @device.error_id, kind: @device.kind, last_location: @device.last_location, last_location_at: @device.last_location_at, model: @device.model, name: @device.name, recent_message: @device.recent_message, settings: @device.settings, ssid: @device.ssid, system_message: @device.system_message, type: @device.type, user_id: @device.user_id } }
    assert_redirected_to device_url(@device)
  end

  test "should destroy device" do
    assert_difference("Device.count", -1) do
      delete device_url(@device)
    end

    assert_redirected_to devices_url
  end
end
