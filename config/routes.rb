Rails.application.routes.draw do
  resources :contacts
  resources :books
  root 'home#index'
  #devise_for :users, controllers: { registrations: 'registrations'}
  devise_for :users, controllers: { registrations: 'registrations'}, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout', password: 'pwreset'}
  
  authenticated :user do
  root to: 'home#index', as: :authenticated_root
end
root to: redirect('/login')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
