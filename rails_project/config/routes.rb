Rails.application.routes.draw do
  root 'photos#index'
  resources :photos, only: [:index, :create]
  put 'musics', to: 'musics#play'

  get '/auth/spotify/callback', to: 'sessions#create'
end
