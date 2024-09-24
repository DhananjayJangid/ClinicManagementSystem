require "test_helper"

class Doctors::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctors_dashboard_index_url
    assert_response :success
  end

  test "should get graph" do
    get doctors_dashboard_graph_url
    assert_response :success
  end
end
