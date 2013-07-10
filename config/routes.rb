PleaseStrongify::Application.routes.draw do
  resources :items
  resources :categories

  devise_for :users

  root :to => 'items#index'
end
