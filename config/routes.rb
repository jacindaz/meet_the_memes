Rails.application.routes.draw do
  root to: "memes#index"

  resources :memes do
    resources :reviews, only: [:create, :edit, :destroy, :update] do
      resources :votes, only: [:create, :update]
    end
  end
end

