Rails.application.routes.draw do
  root :to => "public/homes#top"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  patch "customers/withdraw" => "customers#withdraw"

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  namespace :public do
    get "/" => "homes#top"
    get "/about" => "homes#about"

    resources :items, only: [:index, :show]
    
    resource :customers, only: [:index,:show, :edit, :update]
    get "/customers/unsubscribe" => "customers#unsubscribe"  #顧客の退会確認画面
    patch "/customers/withdraw" => "customers#withdraw"        #顧客の退会処理


    delete "/cart_items/destroy_all" => "cart_items#destroy_all" #カート内商品一括削除
    resources :cart_items, only: [:index, :update, :destroy, :create]

    get "/orders/complete" => "orders#complete" #カート内商品一括削除
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/confirm" => "orders#confirm" #カート内商品一括削除


    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
