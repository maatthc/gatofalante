require 'test_helper'

class AccountSwitchTest < ActionDispatch::IntegrationTest
  def setup
    # It comes from the fixture users.yml
    @user = users(:alexandre)
  end

  test 'should switch to a organization' do
    get login_path
    # The password for this test was setup on the fixture users.yml
    post login_path, params: { session: { email:    @user.email,
                                        password: 'chattingcat' } }
    assert_response :redirect
    get account_switch_to_organization_url, params: { organization_id: 1 }
    follow_redirect!
    assert_response :success
  end
end
