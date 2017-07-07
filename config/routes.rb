Rails.application.routes.draw do
   root to: "home#index"

   resources :properties, only: [:show] do
     get 'filter', on: :collection
   end
end
