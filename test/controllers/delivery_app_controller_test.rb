require "test_helper"

class DeliveryAppControllerTest < ActionDispatch::IntegrationTest
  test "should get dispatcher" do
    get delivery_app_dispatcher_url
    assert_response :success
  end

  test "should get driver" do
    get delivery_app_driver_url
    assert_response :success
  end

  test "should get customer" do
    get delivery_app_customer_url
    assert_response :success
  end
end
