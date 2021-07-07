class AddRspotifyHashToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rspotify_hash, :text
  end
end
