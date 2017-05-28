Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root 'pages#index'
  get 'pages/index' => 'pages#index'
  get 'for-sponsors' => 'pages#for_sponsors'
  get 'for-speakers' => 'pages#for_speakers'

  resources :events, only: %i( show index )
  resources :offers, only: %i( show index )

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
end
