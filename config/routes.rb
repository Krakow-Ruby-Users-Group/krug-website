Rails.application.routes.draw do
  get 'landings/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'landings#index'
end
