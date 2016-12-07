require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    # It comes from the fixture users.yml
    @user = users(:alexandre)
  end

  test "should get index" do
    get login_path
    # The password for this test was setup on the fixture users.yml
    post login_path, params: { session: { email:    @user.email,
                                          password: 'chattingcat' } }
    get posts_index_url
    assert_response :success
  end

  test "should get new" do
    get login_path
    # The password for this test was setup on the fixture users.yml
    post login_path, params: { session: { email:    @user.email,
                                          password: 'chattingcat' } }
    get posts_new_url
    assert_response :success
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end

end
