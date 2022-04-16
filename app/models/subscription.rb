class Subscription < ApplicationRecord
  validates :p256dh, uniqueness: true
  validates :auth, uniqueness: true

  def send_event
    Webpush.payload_send(
      message: JSON.generate({
        title: "Напоминание!",
        body: "Я люблю тебя",
        icon: "images/love-you-icon.png"
      }),
      endpoint: endpoint,
      p256dh: p256dh,
      auth: auth,
      ttl: 24 * 60 * 60,
      vapid: {
        subject: "",
        public_key: Rails.application.credentials.vapid[:public_key],
        private_key: Rails.application.credentials.vapid[:private_key]
      }
    )
  end
end
