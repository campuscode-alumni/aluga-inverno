Rails.application.routes.draw do
  devise_for :owners
  root to: "home#index"


   resources :properties, only: [:show, :new, :create]  do
     get 'filter', on: :collection

     resources :proposals, only: [:new, :index, :create]


   end

   resources :proposals, only: [:show]

end
