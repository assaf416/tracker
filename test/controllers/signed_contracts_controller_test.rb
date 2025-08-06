require "test_helper"

class SignedContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @signed_contract = signed_contracts(:one)
  end

  test "should get index" do
    get signed_contracts_url
    assert_response :success
  end

  test "should get new" do
    get new_signed_contract_url
    assert_response :success
  end

  test "should create signed_contract" do
    assert_difference("SignedContract.count") do
      post signed_contracts_url, params: { signed_contract: { lead_id: @signed_contract.lead_id, name: @signed_contract.name, signed_at: @signed_contract.signed_at } }
    end

    assert_redirected_to signed_contract_url(SignedContract.last)
  end

  test "should show signed_contract" do
    get signed_contract_url(@signed_contract)
    assert_response :success
  end

  test "should get edit" do
    get edit_signed_contract_url(@signed_contract)
    assert_response :success
  end

  test "should update signed_contract" do
    patch signed_contract_url(@signed_contract), params: { signed_contract: { lead_id: @signed_contract.lead_id, name: @signed_contract.name, signed_at: @signed_contract.signed_at } }
    assert_redirected_to signed_contract_url(@signed_contract)
  end

  test "should destroy signed_contract" do
    assert_difference("SignedContract.count", -1) do
      delete signed_contract_url(@signed_contract)
    end

    assert_redirected_to signed_contracts_url
  end
end
