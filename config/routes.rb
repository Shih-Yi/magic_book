Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions: 'admin/devise/sessions',
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :home
  resources :books

  namespace :user do
    root 'books#index'
    resources :books
  end

  namespace :admin do
    root 'home#index'
  end
end
