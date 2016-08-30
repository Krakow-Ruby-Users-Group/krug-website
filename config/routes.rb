Rails.application.routes.draw do
  get 'landings/index'
  root 'landings#index'
  resources :events, only: %i( show index )
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
