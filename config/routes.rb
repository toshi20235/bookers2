Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'homes/top'
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:new, :create, :index, :show]
    resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
