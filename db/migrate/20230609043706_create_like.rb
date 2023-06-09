class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :UserId
      t.integer :PostId
      t.timestamp :CreatedAt
      t.timestamp :UpdatedAt

      t.timestamps
    end
  end
end
