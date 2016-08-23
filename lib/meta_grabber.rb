class MetaGrabber
  def self.run(movie)
    response = Tmdb::Search.movie("#{movie.title} (#{movie.year})")
    tmdb_movie = response.results.detect {|x| x.title.downcase == movie.title.downcase}

    return if tmdb_movie.nil?

    backdrop = "http://image.tmdb.org/t/p/original" + tmdb_movie.backdrop_path
    poster = "http://image.tmdb.org/t/p/original" + tmdb_movie.poster_path
    overview = tmdb_movie.overview
    release_date = tmdb_movie.release_date


    if movie.poster_image.nil?
      movie.remote_poster_image_url = poster
    end

    if movie.backdrop_image.nil?
      movie.remote_backdrop_image_url = backdrop
    end

    movie.overview = overview
    movie.release_date = release_date
    movie.save
  end
end
