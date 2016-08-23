require 'movienight'

namespace :daily do
  desc "TODO"
  task fetch_movies: :environment do
    MovieNight.run
  end
end
