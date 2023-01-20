Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: %i[index new create] do
    resources :transaction_items, only: %i[index new create]
  end

  # Defines the root path route ("/")
  root "home#index"
end
