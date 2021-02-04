Rails.application.routes.draw do
  get 'genres/index'
  get 'genres/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root 'homes#top'
  get 'homes/about'
  resources :items do
    resources :item_comments, only: [:create, :destroy]
  end
  resource :favorites, only: [:create, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
