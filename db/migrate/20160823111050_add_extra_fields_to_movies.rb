class AddExtraFieldsToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :backdrop_image, :string
    add_column :movies, :overview, :text
    add_column :movies, :release_date, :string
  end
end
