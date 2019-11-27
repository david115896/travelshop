Rails.application.routes.draw do


  resources :carts, only:[:index, :create, :destroy]

  resources :activities do
    collection { post :import}
  end
  devise_for :users

  devise_scope :user do
    root :to => 'devise/sessions#new'
    
  end
  resources :users, except:[:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :charges, only:[:new, :create]

end
