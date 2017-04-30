require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Raffle-Mania"
    @user = users(:oscar)
    @other_user = users(:archer)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should get signup" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign up | #{@base_title}"
  end

end
