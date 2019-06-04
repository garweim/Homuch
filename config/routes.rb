Rails.application.routes.draw do
  get 'estimates/index'
  get 'estimates/new'
  get 'estimates/create'
  get 'estimates/show'
  get 'estimates/edit'
  get 'estimates/update'
  get 'estimates/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
