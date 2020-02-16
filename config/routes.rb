Rails.application.routes.draw do
  get '/login', to: 'authorizations#new'
  post '/login', to: 'authorizations#create'
  delete '/logout', to: 'authorizations#destroy'
  # get 'users/new'
resources :users
resources :diaries
root to: 'diaries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
