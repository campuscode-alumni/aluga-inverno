Rails.application.routes.draw do
  devise_for :owners
  root to: "home#index"

  resources :properties, only: [:show, :new, :create] do
    get 'filter', on: :collection
  end
end
