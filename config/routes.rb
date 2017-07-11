Rails.application.routes.draw do
   root to: "home#index"

   resources :properties, only: [:show] do
     get 'filter', on: :collection

     resources :proposals, only: [:new, :index, :create]


   end

   resources :proposals, only: [:show]
end
