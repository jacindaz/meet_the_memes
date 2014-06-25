Rails.application.routes.draw do
  
  devise_for :users
  root 'memes#index'

  resources :memes do
    resources :reviews, only: [:new, :create, :edit, :destroy]
  end

  resources :reviews, only: [:index]

end
