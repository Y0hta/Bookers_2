Rails.application.routes.draw do
  devise_for :users
  get '/' => 'root#top'
  get '/home' => 'root#top'
  get '/home/about' => 'root#about'
  resources :users
  resources :books
end
