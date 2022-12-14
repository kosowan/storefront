Rails.application.routes.draw do
  get 'order', to: 'order#show'
  post 'order/add'
  post 'order/remove'

  devise_for :customers
  devise_scope :customer do
    get '/customers/sign_out' => 'devise/sessions#destroy'
 end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  root to: "home#index"

  get 'home/index'
  get 'product/index'
  get 'product/show'
  get 'products/new'
  get 'products/sale'
  get 'category/index'
  get 'category/show'
  get 'order/myorders'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #stripe stuff
  scope '/checkout' do
    post  'create',   to: 'checkout#create',  as: 'checkout_create'
    get   'cancel',   to: 'checkout#cancel',  as: 'checkout_cancel'
    get   'success',  to: 'checkout#success', as: 'checkout_success'
  end

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show, :new, :sale] do
    collection do
      get "search"
    end
  end
  resources :cart, only: [:create, :destroy]
  resources :order, only: [:add, :remove, :show]

end
