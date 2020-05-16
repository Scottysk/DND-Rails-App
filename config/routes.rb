Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :characters do
    resources :comments
  end
  resources :comments

  root 'sessions#home'

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  patch 'characters/:id', to: 'characters#update'


  get '/auth/google_oauth2/callback' => 'sessions#omniauth' #omniauth



end
