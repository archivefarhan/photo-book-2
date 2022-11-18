class AddUrlToPhoto < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :url, :string
  end
end
