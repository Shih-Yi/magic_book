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
    resources :books do
      member do
        post :update_status
      end
    end
    resources :book_audios do
      member do
        get :download_audio
      end
      collection do
        get :upload_page
      end
    end
  end
end
