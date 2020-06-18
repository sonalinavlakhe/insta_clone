class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :post
      t.references :account
      t.timestamps
    end
  end
end
