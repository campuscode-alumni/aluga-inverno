Rails.application.routes.draw do
  devise_for :users
  devise_for :owners
  root to: 'home#index'
  get 'register', to: 'home#register'
  get  'my_proposals', to: 'proposals#my_proposals'
   resources :properties, only: [:show, :new, :create, :edit, :update]  do
     get 'filter', on: :collection

     resources :reviews, only: [:new, :create]
     resources :proposals, only: [:new, :index, :create] do
       get 'accept', on: :member
     end


     resources :prices, only: [:new, :create]
   end


   resources :proposals, only: [:show] do
     get 'receipt', on: :member
   end


end
