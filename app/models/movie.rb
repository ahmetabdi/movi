class Movie < ApplicationRecord
  mount_uploader :poster_image, MoviePosterImageUploader
end
