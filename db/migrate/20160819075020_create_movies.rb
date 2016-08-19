class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_image
      t.string :url_location
      t.string :rating

      t.timestamps
    end
  end
end
