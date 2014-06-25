Rails.application.routes.draw do
  resources :memes do
    resources :reviews, only: [:index, :show, :new, :create, :edit, :destroy]
  end
end
