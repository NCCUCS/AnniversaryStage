AnniversaryStage::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :photos, :only => [:index, :show, :create]
  resources :places, :only => [:index] do
    resources :photos, :only => [:index, :create]
  end  
end
