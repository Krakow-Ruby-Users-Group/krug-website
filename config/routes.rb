Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root 'pages#index'
  get 'pages/index' => 'pages#index'
  get 'for_sponsors' => 'pages#for_sponsors', path: 'for-sponsors'
  get 'for_speakers' => 'pages#for_speakers', path: 'for-speakers'

  resources :events, only: %i( show index )

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
end
