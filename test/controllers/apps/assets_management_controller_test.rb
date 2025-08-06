require "test_helper"

class Apps::AssetsManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get devices" do
    get apps_assets_management_devices_url
    assert_response :success
  end

  test "should get devices_mobile" do
    get apps_assets_management_devices_mobile_url
    assert_response :success
  end

  test "should get device" do
    get apps_assets_management_device_url
    assert_response :success
  end

  test "should get device_mobile" do
    get apps_assets_management_device_mobile_url
    assert_response :success
  end

  test "should get dispatcher" do
    get apps_assets_management_dispatcher_url
    assert_response :success
  end

  test "should get driver" do
    get apps_assets_management_driver_url
    assert_response :success
  end

  test "should get driver_mobile" do
    get apps_assets_management_driver_mobile_url
    assert_response :success
  end

  test "should get dispatcher_mobile" do
    get apps_assets_management_dispatcher_mobile_url
    assert_response :success
  end

  test "should get ride" do
    get apps_assets_management_ride_url
    assert_response :success
  end

  test "should get ride_mobile" do
    get apps_assets_management_ride_mobile_url
    assert_response :success
  end

  test "should get client" do
    get apps_assets_management_client_url
    assert_response :success
  end

  test "should get client_mobile" do
    get apps_assets_management_client_mobile_url
    assert_response :success
  end

  test "should get dashboarsd" do
    get apps_assets_management_dashboarsd_url
    assert_response :success
  end

  test "should get dashboard_mobile" do
    get apps_assets_management_dashboard_mobile_url
    assert_response :success
  end
end
