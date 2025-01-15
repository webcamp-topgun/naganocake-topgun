Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


scope module: :public do
  root :to =>"homes#top"
  get "about" => "homes#about"
  resources :items, only: [:index, :show]
#customersコントローラのルーティング
  get "customoers/my_page" => "customers#show", as: "my_page"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  get "customers/unsubscribe" => "customers#unsubscribe"
  patch "customers/withdraw" => "customers#withdraw"
#cart_itemsコントローラのルーティング
  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete "cart_items/destroy_all" => "cart_items#destroy_all"
#ordersコントローラのルーティング
  resources :orders, only: [:new, :create, :index, :show]
  post "orders/confirm" => "orders#confirm", as: "confirm"
  get "orders/complete" => "orders#complete", as: "complete"

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
end


namespace :admin do
  root to: "admin/homes#top"
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]

  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
