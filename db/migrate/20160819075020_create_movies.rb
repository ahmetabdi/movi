class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_image
      t.string :backdrop_image
      t.string :url_location
      t.string :rating
      t.string :slug
      t.string :year
      t.text :overview
      t.date :release_date

      t.timestamps
    end
    add_index :movies, :slug, unique: true
  end
end
