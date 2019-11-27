Rails.application.routes.draw do

  resources :sold_items
  resources :orders, only:[:index, :create, :destroy]
  resources :carts, only:[:index, :create, :destroy]
  resources :activities do
    collection { post :import}
  end
  devise_for :users

  devise_scope :user do
    root :to => 'activities#index'
  end
  resources :users, except:[:index, :new, :create]
end
