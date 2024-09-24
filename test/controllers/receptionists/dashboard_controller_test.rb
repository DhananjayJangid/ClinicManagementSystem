require "test_helper"

class Receptionists::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get receptionists_dashboard_index_url
    assert_response :success
  end
end
