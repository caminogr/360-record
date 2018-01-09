Rails.application.routes.draw do
  root 'photos#index'
  resources :photos, only: [:index, :create]
  put 'musics/play', to: 'musics#play'
  put 'musics/pause', to: 'musics#pause'

  get '/auth/spotify/callback', to: 'sessions#create'
end
