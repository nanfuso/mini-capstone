Rails.application.routes.draw do
  get '/' => 'computers#index'
  get '/computers' => 'computers#index'
  get '/computers/new' => 'computers#new'
  post '/computers' => 'computers#create'
  get '/computers/:id'=> 'computers#show'
  get '/computers/:id/edit' => 'computers#edit'
  patch '/computers/:id' => 'computers#update'
  delete '/computers/:id' => 'computers#destroy'

  get '/random' => 'computers#random'

  get '/signup' => 'users#new'
  post 'users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/orders'=> 'orders#create'
  get '/orders/:id' => 'orders#show'

end
