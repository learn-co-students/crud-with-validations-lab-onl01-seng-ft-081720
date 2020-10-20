class SongsController < ApplicationController

    def index 
        @song = Song.all 
       
    end 

    def show 
        @song = Song.find_by_id(params[:id])
    end 

    def new 
        @song = Song.new 
    end 

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save 
            redirect_to song_path(@song) 
        else 
            render :new 
        end 
    end 
    
    
    
    def edit 
        @song = Song.find_by_id(params[:id])
       
    end 

    def update 
        @song = Song.find_by_id(params[:id])
        @song.update(song_params)
        if @song.valid?
            redirect_to song_path
        else 
            render :edit 
        end 

    end 
    def destroy
        Song.find(params[:id]).destroy
        redirect_to "/songs"
      end

    private 

    def song_params 
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 

end
