require "test_helper"

class WizardControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get wizard_home_url
    assert_response :success
  end
end
