require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "user@example.com", zipcode: 12345)
  end
  test "create user" do
    @user.save!
    assert_equal @user.save!, true
  end

end
