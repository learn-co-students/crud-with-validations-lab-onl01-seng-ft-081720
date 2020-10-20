
class SongsController < ApplicationController

    def index
        @songs = Song.all
        render "index"
    end

    def new
        @song = Song.new

        render "new"
    end

    def show
        @song = Song.find_by_id(params[:id])
    end

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render "new"
        end
    end

    def edit
        @song = Song.find_by_id(params[:id])
        render "new"
    end


    def update
        # if song.valid?
        @song = Song.find_by_id(params[:id])
        @song.update(song_params)
        if @song.valid?
        redirect_to song_path(@song)
        else
            render "edit"
        end
        
    end

    def destroy
        Song.find_by_id(params[:id]).destroy
        redirect_to songs_path
    end


    private

    def song_params
        params.require(:song).permit!
    end





end
