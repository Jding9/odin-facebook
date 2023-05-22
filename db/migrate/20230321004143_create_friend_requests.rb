class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|

      t.timestamps
    end

    add_reference :friend_requests, :requestor, foreign_key: { to_table: :users }
    add_reference :friend_requests, :receiver, foreign_key: { to_table: :users }
  end
end
