require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  setup :activate_authlogic

  def test_should_redirect_index_if_logged_out
    get :index
    assert_redirected_to login_path
  end

  def test_should_get_index
    UserSession.create(users(:user1))
    get :index
    assert_response :success
    assert assigns(:projects)
    assert assigns(:activity_items)
    assert assigns(:activity_dates)
  end
end
