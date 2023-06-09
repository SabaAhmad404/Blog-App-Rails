class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :AuthorId
      t.string :Title
      t.string :Text
      t.timestamp :CreatedAt
      t.timestamp :UpdatedAt
      t.integer :ComentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
