class ScenesController < ApplicationController
  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find_by(slug: params[:slug])

    try(@scene.slug.gsub("-", "_") + "_partial")
  end

  private

  def love_you_so_much_partial
    vapid_public_key = Rails.application.credentials.vapid[:public_key]
    @publicVapidKey = Base64.urlsafe_decode64(vapid_public_key).bytes
  end
end
