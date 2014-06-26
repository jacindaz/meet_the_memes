Rails.application.routes.draw do

  devise_for :users
  root to: "memes#index"

  resources :memes do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

end

