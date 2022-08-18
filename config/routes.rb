Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :books, only: [:index, :show]
  resources :users, only: [:index, :show, :edit, :update, :create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
