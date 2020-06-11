class AddDefaultToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :active, :boolean, default: true
  end
end
