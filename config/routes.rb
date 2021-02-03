Rails.application.routes.draw do
  devise_for :users
  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
