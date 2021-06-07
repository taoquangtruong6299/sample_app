require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  est "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
    post users_path, params: { user: { name: "",
    email: "user@invalid",
    password:
    "foo",
    password_confirmation: "bar" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.FILL_IN
    assert is_logged_in?
    end
end
