class SubscriptionsController < ApplicationController
  def index
    vapid_public_key = Rails.application.credentials.vapid[:public_key]
    @decodedVapidPublicKey = Base64.urlsafe_decode64(vapid_public_key).bytes
  end
end
