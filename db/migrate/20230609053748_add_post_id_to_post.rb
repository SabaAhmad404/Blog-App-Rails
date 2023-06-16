class AddPostIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_id, :integer
    add_index :posts, :post_id
  end
end
