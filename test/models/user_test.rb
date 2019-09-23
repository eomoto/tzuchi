require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "an admin user can be created" do
    user = User.create!(email: "test@gmail.com", password: "password", admin: true)
    assert user.is_admin? == true, 'User was not an admin when it should be'
  end

  test "a non-admin user can be created" do
    user = User.create!(email: "test@gmail.com", password: "password", admin: false)
    assert user.is_admin? == false, 'User was an admin when it shouldn\'t be'
  end
end
