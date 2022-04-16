class AddSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :p256dh
      t.string :auth
      t.string :endpoint

      t.timestamps
    end
  end
end
