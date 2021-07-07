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
    hash = JSON.parse(current_user.rspotify_hash)
    spotify_user = RSpotify::User.new(hash)
    if playlist.save
      spotify_user.create_playlist!(playlist.name)
      redirect_to playlist_path(playlist)
    else
      render :new
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
