class MoviesController < ApplicationController
  def show
    @movie = Movie.friendly.find(params[:id])
  end

  def autocomplete
    render json: Movie.search(params[:query], {
      fields: ["title^5", "author"],
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
  end
end
