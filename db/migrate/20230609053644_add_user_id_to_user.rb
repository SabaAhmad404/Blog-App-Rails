class AddUserIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_id, :integer
    add_index :users, :user_id
  end
end
