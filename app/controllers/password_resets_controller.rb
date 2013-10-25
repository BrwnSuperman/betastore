class PasswordResetsController < ApplicationController
  #before_action :set_password_reset, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_log_in

  def create
    customer = Customer.find_by(email: params[:email])
    password_reset = customer.password_resets.build
    password_reset.save
    redirect_to log_in_path
  end
  #
  #def edit
  #  @customer = Customer.find_by_password_reset_token!(params[:id])
  #end
  #
  #def update
  #  @customer = Customer.find_by_password_reset_token!(params[:id])
  #  if @customer.password_reset_sent_at < 2.hours.ago
  #    redirect_to new_password_reset_path, :alert => "Password reset has expired."
  #  elsif @customer.update_attributes(params[:customer])
  #    redirect_to root_url, :notice => "Password has been reset!"
  #  else
  #    render :edit
  #  end
  #end
end