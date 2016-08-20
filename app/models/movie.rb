class Movie < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :poster_image, MoviePosterImageUploader

  private

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
