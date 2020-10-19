class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
  end

  def show 
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)
    
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id]).destroy
    redirect_to(songs_url)
  end
  
  private

  def song_params
    params.require(:song).permit!
  end

end

