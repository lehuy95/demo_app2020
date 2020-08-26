require 'test_helper'

class DemoAppsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get demo_apps_home_url
    assert_response :success
  end

  test "should get help" do
    get demo_apps_help_url
    assert_response :success
  end

  test "should get about" do
    get demo_apps_about_url
    assert_response :success
  end

  test "should get contact" do
    get demo_apps_contact_url
    assert_response :success
  end

end
