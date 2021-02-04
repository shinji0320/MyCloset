Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'homes/about'
  resources :items do
    resources :item_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
