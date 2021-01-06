Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :comments
end
