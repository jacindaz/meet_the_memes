Rails.application.routes.draw do

  devise_for :users
  root to: "memes#index"

  resources :memes do
    resources :reviews, only: [:create, :edit, :destroy, :update] do
      resources :votes, only: [:create, :update]
    end
  end

end

