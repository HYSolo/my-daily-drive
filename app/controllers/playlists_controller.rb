class PlaylistsController < ApplicationController
  
  def index
    @playlists = current_user.playlists
  end

  def new
    @playlist = Playlist.new
  end

  def create
    playlist = Playlist.new(playlist_params)
    playlist.user = current_user
    spotify_user = RSpotify::User.find(current_user.username)
    spotify_user.create_playlist!(playlist.name)
    if playlist.save
      redirect_to playlists_path
    else
      render :new
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
