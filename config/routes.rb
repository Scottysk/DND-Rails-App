Rails.application.routes.draw do
  resources :characters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  root 'application#home'

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
