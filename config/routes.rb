Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'movies', to: 'pages#movies'
  get 'ratings', to: 'pages#ratings'
  get 'tv-shows', to: 'pages#tv_shows'
  get 'trending', to: 'pages#trending'
end
