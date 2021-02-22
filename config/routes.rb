Rails.application.routes.draw do
  devise_for :users
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  root 'homes#top'
  get 'homes/about'
  get '/search', to: 'searchs#search'

  resources :items do
    resources :item_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :coordinetes, only: [:index, :create, :edit, :update, :destroy]
end
