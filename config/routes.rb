Rails.application.routes.draw do


  resources :machines do
    resources :indicateurs
  end

  namespace :api do
    resources :machines
  end

  root :to => 'machines#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
