require 'test_helper'

class CustomerMailerTest < ActionMailer::TestCase
  test "password_reset" do
    mail = CustomerMailer.password_reset(password_resets(:test))
    assert_equal "Password Reset Instructions", mail.subject
    assert_equal ["test@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match password_resets(:test).token, mail.body.encoded
  end

  test "edit with valid id and token" do
    assert customers(:test).authenticate('password')
    get :edit, id: password_resets(:test).id,
               token: password_resets(:test).token
    assert_response :success
  end

  test "edit with valid id and invaild token" do
    get :edit, id: password_resets(:test).id,
        token: 'fail'
    assert_redirected_to forgot_password_path
  end

end
