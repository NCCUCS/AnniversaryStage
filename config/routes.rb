AnniversaryStage::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :photos, :only => [:index, :show, :create] do
    get 'locations', :on => :collection
  end
end
