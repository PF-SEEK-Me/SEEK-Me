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
    get "customer/confirm" => "customers#confirm", as: "confirm_customer"#退会確認ページ
    put "customer/hide" => "customers#hide", as: "hide_customer"#退会処理
    get "customer/favorite" => "customers#favorite", as: "favorite_customer"#SEEK Me!ページ
    resources :articles, only: [:index, :show] do
      resource :favorite, only: [:create, :destroy]
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
