require "test_helper"

class TaxiAppControllerTest < ActionDispatch::IntegrationTest
  test "should get dispatcher" do
    get taxi_app_dispatcher_url
    assert_response :success
  end

  test "should get driver" do
    get taxi_app_driver_url
    assert_response :success
  end

  test "should get customer" do
    get taxi_app_customer_url
    assert_response :success
  end
end
