require "application_system_test_case"

class DeviceKindsTest < ApplicationSystemTestCase
  setup do
    @device_kind = device_kinds(:one)
  end

  test "visiting the index" do
    visit device_kinds_url
    assert_selector "h1", text: "Device kinds"
  end

  test "should create device kind" do
    visit device_kinds_url
    click_on "New device kind"

    fill_in "Descriptio", with: @device_kind.descriptio
    fill_in "Device", with: @device_kind.device_id
    fill_in "Image url", with: @device_kind.image_url
    fill_in "Kind", with: @device_kind.kind_id
    fill_in "Name", with: @device_kind.name
    fill_in "Price", with: @device_kind.price
    click_on "Create Device kind"

    assert_text "Device kind was successfully created"
    click_on "Back"
  end

  test "should update Device kind" do
    visit device_kind_url(@device_kind)
    click_on "Edit this device kind", match: :first

    fill_in "Descriptio", with: @device_kind.descriptio
    fill_in "Device", with: @device_kind.device_id
    fill_in "Image url", with: @device_kind.image_url
    fill_in "Kind", with: @device_kind.kind_id
    fill_in "Name", with: @device_kind.name
    fill_in "Price", with: @device_kind.price
    click_on "Update Device kind"

    assert_text "Device kind was successfully updated"
    click_on "Back"
  end

  test "should destroy Device kind" do
    visit device_kind_url(@device_kind)
    click_on "Destroy this device kind", match: :first

    assert_text "Device kind was successfully destroyed"
  end
end
