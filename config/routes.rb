Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'homes/about'
  resources :items
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
