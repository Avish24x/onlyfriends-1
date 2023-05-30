require "test_helper"

class FakeFriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fake_friends_index_url
    assert_response :success
  end

  test "should get create" do
    get fake_friends_create_url
    assert_response :success
  end

  test "should get new" do
    get fake_friends_new_url
    assert_response :success
  end
end
