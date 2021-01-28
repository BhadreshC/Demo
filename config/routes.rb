Rails.application.routes.draw do
  resources :projects
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' } 
  resources :delivery_boys do 
    member do
      get :cancel_order
      get 'deliverd_order',to: 'delivery_boys#deliverd_order'
    end
  end
  resources :orders do
    member do
      get :cancel_order
      get 'deliverd_order',to: 'orders#deliverd'
      post 'assign_order',to: 'orders#assign'
    end
  end
  resources :posts
  resources :authors
  resources :author_details
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :comments
  resources :products do
    collection do
      get 'batch_operation'
    end
    member do
      get 'remove_description'
    end
  end
  resources :varients
end
