require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  test "forgot password form" do
    get :new
    Rails.logger.debug @response.body
    assert_response :success
    assert_select 'form[action=/forgot_password]'
    assert_select 'input[name=email]'
  end

  test "forgot password create" do
    assert_difference 'PasswordReset.count' do
      post :create
    end
    assert_redirected_to log_in_path
  end
end
