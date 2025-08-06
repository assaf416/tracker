require "application_system_test_case"

class SignedContractsTest < ApplicationSystemTestCase
  setup do
    @signed_contract = signed_contracts(:one)
  end

  test "visiting the index" do
    visit signed_contracts_url
    assert_selector "h1", text: "Signed contracts"
  end

  test "should create signed contract" do
    visit signed_contracts_url
    click_on "New signed contract"

    fill_in "Lead", with: @signed_contract.lead_id
    fill_in "Name", with: @signed_contract.name
    fill_in "Signed at", with: @signed_contract.signed_at
    click_on "Create Signed contract"

    assert_text "Signed contract was successfully created"
    click_on "Back"
  end

  test "should update Signed contract" do
    visit signed_contract_url(@signed_contract)
    click_on "Edit this signed contract", match: :first

    fill_in "Lead", with: @signed_contract.lead_id
    fill_in "Name", with: @signed_contract.name
    fill_in "Signed at", with: @signed_contract.signed_at.to_s
    click_on "Update Signed contract"

    assert_text "Signed contract was successfully updated"
    click_on "Back"
  end

  test "should destroy Signed contract" do
    visit signed_contract_url(@signed_contract)
    click_on "Destroy this signed contract", match: :first

    assert_text "Signed contract was successfully destroyed"
  end
end
