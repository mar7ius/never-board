Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games do
    resources :bookings
  end

  # get "pages", to: "pages#dashboard"
  get "pages/dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
