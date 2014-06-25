Rails.application.routes.draw do
  
  devise_for :users
  root 'memes#index'

  resources :memes #do
    #resources :reviews, only: [:index, :new, :create]
  #end
  
  #resources :reviews, only: [:show, :edit, :update, :destroy]
end
