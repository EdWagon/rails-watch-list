require 'open-uri'
require 'json'

class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @movies = Movie.all
    end

    respond_to do |format|
      format.html
      format.js { render partial: "movies_list", locals: { movies: @movies } } # Renders only the movie list
    end
  end

  def show
    @movie = Movie.find(params[:id])

    where_to_watch_url = "https://tmdb.lewagon.com/movie/#{@movie.movie_id}/watch/providers"
    api_response = URI.open(where_to_watch_url).read
    @where_to_watch_data = JSON.parse(api_response)["results"]["AU"]

  end
end
