Rails.application.routes.draw do
  resources :memes do
    resources :reviews, only: [:new, :create, :edit, :destroy]
  end

  resources :reviews, only: [:index]
end
