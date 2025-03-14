class AddReleaseDateAndPopularityToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :release_date, :date
    add_column :movies, :popularity, :integer
  end
end
