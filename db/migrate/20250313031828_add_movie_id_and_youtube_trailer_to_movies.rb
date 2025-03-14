class AddMovieIdAndYoutubeTrailerToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :movie_id, :integer
    add_column :movies, :youtube_trailer, :string
  end
end
