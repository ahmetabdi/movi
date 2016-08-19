require 'uri'
require 'net/http'
require 'nokogiri'

class MovieNight
  def self.run
    MovieLink.destroy_all
    Movie.destroy_all
    initial_html = Net::HTTP.get(URI('http://movienight.ws'))
    initial_html_doc = Nokogiri::HTML(initial_html)

    movies = initial_html_doc.css('#box_movies .movie')

    movies.each do |movie|
      title = movie.at_css('img')['alt']
      image_url = movie.at_css('img')['src']
      url_location = movie.at_css('a')['href']
      rating = movie.at_css('.imdb').text.gsub(' ', '')

      detail_html = Net::HTTP.get(URI(url_location))
      detail_html_doc = Nokogiri::HTML(detail_html)

      title = detail_html_doc.at_css('.headingder .dataplus h1').text
      iframe_url = detail_html_doc.at_css('iframe')['src']

      # Only continue if the movie has an iframe and a title
      if title && iframe_url
        if Movie.find_by_title(title).nil?
          Movie.create(title: title, remote_poster_image_url: image_url, url_location: url_location, rating: rating)
        end

        if MovieLink.find_by_link(iframe_url).nil?
          MovieLink.create(link: iframe_url, movie: Movie.find_by_title(title))
        end
      end
      # <iframe src="http://www.filepup.net/play/4Ub8VXE1471259719" frameborder="0" width="560" height="315" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
    end
  end
end


