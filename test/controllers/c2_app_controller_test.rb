require "test_helper"

class C2AppControllerTest < ActionDispatch::IntegrationTest
  test "should get dispatcher" do
    get c2_app_dispatcher_url
    assert_response :success
  end

  test "should get driver" do
    get c2_app_driver_url
    assert_response :success
  end

  test "should get customer" do
    get c2_app_customer_url
    assert_response :success
  end

  test "should get commander" do
    get c2_app_commander_url
    assert_response :success
  end
end
