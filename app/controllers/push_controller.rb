class PushController < ApplicationController
  attr_reader :subscription

  before_action :create_subscription

  def create
    subscription.send_event
  end

  def destroy
    subscription.destroy
  end

  private

  def create_subscription
    @subscription = Subscription.find_or_create_by(
      endpoint: params[:subscription][:endpoint],
      p256dh: params[:subscription][:keys][:p256dh],
      auth: params[:subscription][:keys][:auth]
    );
  end
end
