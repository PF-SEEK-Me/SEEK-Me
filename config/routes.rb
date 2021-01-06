Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations",
    passwords: "admins/passwords"
  }

  root "admins/articles#index"

  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations",
    passwords: "customers/passwords"
  }

  namespace :admins do
    resources :genres,   only: [:index, :create, :edit, :update]
    resources :articles, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
