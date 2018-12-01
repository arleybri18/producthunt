Rails.application.routes.draw do
  
  root 'products#index'

  #rutas para la session
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'products', to: 'products#index'
  # get 'products/new', to: 'products#new', as: 'new_product'
  # post 'products', to: 'products#create'
  # get 'products/:id', to: 'products#show', as: 'product'
  # get 'products/:id/edit', to: 'products#edit', as: 'edit_product'
  # patch 'products/:id', to: 'products#update'
  # delete 'products/:id', to: 'products#destroy'

  #estas rutas se pueden cambiar por la sentencia
  resources :products do
    resources :comments, only: [:create]
  end

  #Se puede hacer lo siguente para restringir o permitir metodos segun corresponda
  #resources :products, only: [:index, :new]
  #resources :products, except: [:index, :new]

  #rutas para la cercaion de usuarios
  resources :users, only: [:new, :create]

  
end
