every 1.hour do
  rake 'subscriptions:send_event'
end
