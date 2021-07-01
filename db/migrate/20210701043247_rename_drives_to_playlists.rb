class RenameDrivesToPlaylists < ActiveRecord::Migration[6.0]
  def change
    rename_table :drives, :playlists
  end
end
