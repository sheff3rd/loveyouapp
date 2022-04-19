module ScenesHelper
  def generate_vapid_key
    vapid_public_key = Rails.application.credentials.vapid[:public_key]
    Base64.urlsafe_decode64(vapid_public_key).bytes
  end
end
