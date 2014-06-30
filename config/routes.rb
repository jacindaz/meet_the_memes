Rails.application.routes.draw do

  devise_for :users
  root to: "memes#index"

  namespace :admin do
    resources :memes, only: [:index, :show, :destroy]
    resources :reviews, only: :destroy
  end

  resources :memes do
    resources :reviews, only: [:create, :edit, :update, :destroy] do
      resources :votes, only: [:create, :update]
    end
  end

end

