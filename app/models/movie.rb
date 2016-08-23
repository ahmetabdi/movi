class Movie < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :poster_image, MoviePosterImageUploader
  mount_uploader :backdrop_image, MovieBackdropImageUploader

  has_many :movie_links

  private

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
