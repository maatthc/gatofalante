require 'test_helper'

class AccountSwitchControllerTest < ActionDispatch::IntegrationTest
  test "should get to_user" do
    get account_switch_to_user_url
    assert_response :success
  end

  test "should get to_organization" do
    get account_switch_to_organization_url
    assert_response :success
  end

end
