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
end
