require "pry"
class SongsController < ApplicationController
    def index
        @song = Song.all

    end

    
    def new
        @song = Song.new

    end

    def edit
        @song = find_song
    end

    def show
        @song = find_song
       
    end

    def create
        @song = Song.new(song_params(:name))
        @song.save
        redirect_to song_path(@song)
    end

    def update
        @song = find_song
        @song.update(song_params(:song))
        redirect_to song_path(@song)
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end

    def find_song
        Song.find(params[:id])
    end
    
    
    
end
