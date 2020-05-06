class ArtistsController < ApplicationController
    def index
        @artist = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def edit
        @artist = find_artist
    end

    def show
        @artist = find_artist

    end

    def create
        @artist = Artist.new(artist_params(:name, :bio))
        @artist.save
        redirect_to artist_path(@artist)
    end

    def update
        @artist = find_artist
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end

    def find_artist
        Artist.find(params[:id])
    end
    


end
