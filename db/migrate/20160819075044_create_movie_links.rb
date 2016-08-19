class CreateMovieLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_links do |t|
      t.string :link
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
