class AddContentIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :content_id, :integer
  end
end