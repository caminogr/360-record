Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'photos#index'
  resources :photos, only: [:index, :create]
  put 'musics', to: 'musics#play'

  get 'callback', to: 'callbacks#spotify'
  # get '/auth/spotify/callback', to: 'users#spotify'
end
