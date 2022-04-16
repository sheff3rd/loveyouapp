namespace :subscriptions do
  desc "Send push notifications"
  task send_event: :environment do
    Subscription.find_each do |subscription|
      subscription.send_event
    end
  end
end
