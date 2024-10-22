class AddUnsubscribeHashAndCommentSubscriptionToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :unsubscribe_hash, :string
    add_column :users, :comment_subscription, :boolean
  end
end