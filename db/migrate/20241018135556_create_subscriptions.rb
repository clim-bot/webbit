class CreateSubscriptions < ActiveRecord::Migration[7.2]
  def change
    create_table :subscriptions do |t|
      t.references :community, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
