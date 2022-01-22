class FriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friendrequests do |t|
      t.integer "requestor_id"
      t.integer "receiver_id"
      t.timestamps
    end
  end
end