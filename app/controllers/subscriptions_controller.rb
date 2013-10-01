class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to @subscription, notice: 'Subscription was successfully created.'
    else
      render action: 'new'
    end
  end
end