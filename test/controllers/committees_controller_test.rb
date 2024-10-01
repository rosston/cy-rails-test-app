require "test_helper"

class CommitteesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get committees_show_url
    assert_response :success
  end
end
