require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    user = User.new

    assert_not user.valid?
    assert_equal [:email, :password, :role], user.errors.keys
  end

  test "should not save user without email, password and role" do
    user = User.new
    assert_not user.save

    user.email = "test_user@test_mail.com"
    assert_not user.save

    user.password = "strong_password"
    assert_not user.save

    user.role = "user"
    assert user.save
  end
end
