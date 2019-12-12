class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :'/songs/index'
  end

  get "/songs/new" do
    erb :'/songs/new'
  end

<<<<<<< HEAD
  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    erb :'songs/show'
    erb :'songs/show', locals: {message: "Successfully created song."}
=======
  post "/songs" do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre = params[:genre][:name]
    @song.save
    redirect to '/songs/#{@song.slug}'
>>>>>>> 199cdb3e22cd25fa347beeac89956c04fa52c295
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
