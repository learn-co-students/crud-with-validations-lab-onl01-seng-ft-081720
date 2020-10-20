class SongsController < ApplicationController
    before_action :song, only: [:show, :edit, :update, :destroy]

    def index 
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def show
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @song.update(song_params)
          redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        @song.destroy
        redirect_to songs_path
    end
     
    private

    def song
        @song = Song.find_by_id(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :artist_name, :genre, :release_year, :released)
    end
end