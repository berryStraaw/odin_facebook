class CreateLikedComments < ActiveRecord::Migration[6.1]
  def change
    create_table :liked_comments do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.timestamps
    end
  end
end
