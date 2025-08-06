require "test_helper"

class Apps::DeliveryControllerTest < ActionDispatch::IntegrationTest
  test "should get dispatcher" do
    get apps_delivery_dispatcher_url
    assert_response :success
  end

  test "should get driver" do
    get apps_delivery_driver_url
    assert_response :success
  end

  test "should get driver_mobile" do
    get apps_delivery_driver_mobile_url
    assert_response :success
  end

  test "should get dispatcher_mobile" do
    get apps_delivery_dispatcher_mobile_url
    assert_response :success
  end

  test "should get ride" do
    get apps_delivery_ride_url
    assert_response :success
  end

  test "should get ride_mobile" do
    get apps_delivery_ride_mobile_url
    assert_response :success
  end

  test "should get client" do
    get apps_delivery_client_url
    assert_response :success
  end

  test "should get client_mobile" do
    get apps_delivery_client_mobile_url
    assert_response :success
  end

  test "should get dashboarsd" do
    get apps_delivery_dashboarsd_url
    assert_response :success
  end

  test "should get dashboard_mobile" do
    get apps_delivery_dashboard_mobile_url
    assert_response :success
  end
end
