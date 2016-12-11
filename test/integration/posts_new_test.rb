require 'test_helper'

class PostsNewTest < ActionDispatch::IntegrationTest
  def setup
    # It comes from the fixture users.yml
    @user = users(:alexandre)
  end
  test "should create a new post" do
    get login_path
    # The password for this test was setup on the fixture users.yml
    post login_path, params: { session: { email:    @user.email,
                                          password: 'chattingcat' } }
    get posts_new_url
    assert_response :success
    assert_difference 'Post.count',1 do
      post posts_new_path, params: { post: { content: "Test test test" } }
    end
  end
end
