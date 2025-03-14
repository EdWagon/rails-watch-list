require 'open-uri'
require 'json'
require 'parallel'

puts "Cleaning database..."
Movie.destroy_all

# Define the method that processes each movie
def process_movie(movie)
  new_movie = Movie.new(
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    popularity: movie["popularity"],
    release_date: Date.parse(movie["release_date"]),
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    movie_id: movie["id"]
  )

  yt_url = "https://tmdb.lewagon.com/movie/#{new_movie.movie_id}/videos?language=en-US"
  yt_serialized = URI.open(yt_url).read
  yt_data = JSON.parse(yt_serialized)

  # Separate official and unofficial trailers
  trailers = yt_data["results"].select { |video| video["type"] == "Trailer" }
  official_trailers = trailers.select { |video| video["official"] == true }
  unofficial_trailers = trailers.reject { |video| video["official"] == true }

  selected_trailer = official_trailers.first || unofficial_trailers.first

  if selected_trailer
    new_movie.youtube_trailer = "https://www.youtube.com/embed/#{selected_trailer['key']}"
  end

  new_movie.save
  puts "Created #{new_movie.title}"
end

(1..5).each_with_index do |page|
  url = "https://tmdb.lewagon.com/movie/top_rated?language=en-US&page=#{page}"
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)["results"]

  # Parallelize the movie processing
  Parallel.each(movies.first(20), in_threads: 4) do |movie|
    process_movie(movie)
  end
end

puts "Finished! Created #{Movie.count} movies."
