Rails.application.routes.draw do
  root to: "customers/customers#about"

  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations",
    passwords: "admins/passwords"
  }

  namespace :admins do
    resources :genres,   only: [:index, :create, :edit, :update]
    resources :articles, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show]
  end


  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations",
    passwords: "customers/passwords"
  }

  scope module: :customers do
    resource :customer, only: [:show, :edit, :update]
    get "confirm/customer" => "customers#confirm"
    put "hide/customer" => "customers#hide"
    resources :articles, only: [:index, :show]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
