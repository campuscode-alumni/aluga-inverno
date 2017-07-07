Rails.application.routes.draw do
   root to: "home#index"
   resources :property, only: [:show]
end
