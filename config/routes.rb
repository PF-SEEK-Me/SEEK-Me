Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations",
    passwords: "admins/passwords"
  }

  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations",
    passwords: "customers/passwords"
  }

  scope module: :admins do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
