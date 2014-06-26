Rails.application.routes.draw do
  root to: "memes#index"

  resources :memes do
    resources :reviews, only: [:index, :show, :new, :create, :edit, :destroy] do
      resources :votes, only: [:new, :create]
    end
  end
end

