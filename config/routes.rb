Rails.application.routes.draw do
  resources :home, only: :index
  resources :groups, only: [:index, :new, :create],path: 'categories' do
    resources :expenses, only: [:index, :new, :create] 
  end
  devise_for :users

  # Add the following route for signing out
  resources :users, only: [:show]

   root "home#index"
end