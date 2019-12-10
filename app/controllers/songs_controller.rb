class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post "/new_song" do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre = params[:genre][:name]
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(:slug)
    erb :'/songs/show'
  end

end
