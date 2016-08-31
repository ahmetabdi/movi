class MetaGrabber
  def self.run(movie)
    response = Tmdb::Search.movie("#{movie.title} (#{movie.year})")
    tmdb_movie = response.results.detect {|x| x.title.downcase == movie.title.downcase}

    return if tmdb_movie.nil?

    if tmdb_movie.backdrop_path
      backdrop = "http://image.tmdb.org/t/p/original" + tmdb_movie.backdrop_path
    end

    if tmdb_movie.poster_path
      poster = "http://image.tmdb.org/t/p/original" + tmdb_movie.poster_path
    end

    overview = tmdb_movie.overview
    release_date = tmdb_movie.release_date

    if movie.backdrop_image.file.nil? && backdrop && tmdb_movie.backdrop_path
      p '!! Adding backdrop image for ' + movie.title
      movie.remote_backdrop_image_url = backdrop
    end

    if movie.poster_image.file.nil? && poster && tmdb_movie.poster_path
      p '!! Addinng poster image' + movie.title
      movie.remote_poster_image_url = poster
    end

    movie.overview = overview
    movie.release_date = release_date
    movie.save
  end
end
