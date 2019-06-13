Rails.application.routes.draw do
  resources :projects do
    member do
      post "new_loan"
      get "new_investment"
    end
    resources :estimates
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
