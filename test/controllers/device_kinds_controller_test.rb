require "test_helper"

class DeviceKindsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @device_kind = device_kinds(:one)
  end

  test "should get index" do
    get device_kinds_url
    assert_response :success
  end

  test "should get new" do
    get new_device_kind_url
    assert_response :success
  end

  test "should create device_kind" do
    assert_difference("DeviceKind.count") do
      post device_kinds_url, params: { device_kind: { descriptio: @device_kind.descriptio, device_id: @device_kind.device_id, image_url: @device_kind.image_url, kind_id: @device_kind.kind_id, name: @device_kind.name, price: @device_kind.price } }
    end

    assert_redirected_to device_kind_url(DeviceKind.last)
  end

  test "should show device_kind" do
    get device_kind_url(@device_kind)
    assert_response :success
  end

  test "should get edit" do
    get edit_device_kind_url(@device_kind)
    assert_response :success
  end

  test "should update device_kind" do
    patch device_kind_url(@device_kind), params: { device_kind: { descriptio: @device_kind.descriptio, device_id: @device_kind.device_id, image_url: @device_kind.image_url, kind_id: @device_kind.kind_id, name: @device_kind.name, price: @device_kind.price } }
    assert_redirected_to device_kind_url(@device_kind)
  end

  test "should destroy device_kind" do
    assert_difference("DeviceKind.count", -1) do
      delete device_kind_url(@device_kind)
    end

    assert_redirected_to device_kinds_url
  end
end
