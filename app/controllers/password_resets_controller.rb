class PasswordResetsController < ApplicationController
  #before_action :set_password_reset, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_log_in

  before_filter :check_token, only: [:edit, :update]

  def create
    customer = Customer.find_by(email: params[:email])
    if customer
      password_reset = customer.password_resets.build
      password_reset.save!
      CustomerMailer.password_reset(password_reset).deliver
      redirect_to '/', notice: 'Check your email for instructions on how to reset your password'
    else
      render 'new'
    end
  end

  def update
    if @password_reset.customer.update_attributes(password: params[:password])
      redirect_to log_in_path, notice: 'Your password has been reset!'
    else
      render 'edit'
    end
  end

  protected

  def check_token
    @password_reset = PasswordReset.find_by(id: params[:id])
    unless @password_reset.try(:token) == params[:token]
      redirect_to forgot_password_path, alert: 'Your password reset link has expired, please enter your email address again to getan email with a new link'
    end
  end
end