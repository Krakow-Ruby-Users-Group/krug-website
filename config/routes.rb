Rails.application.routes.draw do
  get 'pages/index' => 'pages#index'
  root 'pages#index'
  get 'for_sponsors' => 'pages#for_sponsors', path: 'for-sponsors'
  get 'for_speakers' => 'pages#for_speakers', path: 'for-speakers'
  resources :events, only: %i( show index )
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
