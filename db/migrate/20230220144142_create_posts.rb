class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :article, null: false
      t.string :place
      t.string :link
      t.string :price
      t.integer :perspn_id
      t.references :user, null: false, foreign_keey: true

      t.timestamps
    end
  end
end
