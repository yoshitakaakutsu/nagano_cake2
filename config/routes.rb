Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/top',as:'routes'
  root to:"public/homes#top"

  get "/about" => "public/homes#about", as: "about"


  resources :admins, only: [:new, :create, :destroy]

  get "admin/genres" => "admin/genres#index", as: "genres"
  post "admin/genres" => "admin/genres#create"
  get "admin/genres/:id/edit" => "admin/genres#edit", as: "edit_genre"
  patch "admin/genres/:id" => "admin/genres#update", as: "update_genere"

  get "admin/products" => "admin/products#index", as: "products"
  get "admin/products/new" => "admin/products#new"
  post "admin/products" => "admin/products#create"
  get "admin/products/:id" => "admin/products#show", as: "products_show"
  get "admin/products/:id/edit" => "admin/products#edit", as: "products_edit"
  patch "admin/products/:id" => "admin/products#update", as: "update_product"

  get "admin/customers" => "admin/customers#index", as: "admin_customers_index"
  get "admin/customers/:id" => "admin/customers#show", as: "admin_customers_show"
  get "admin/customers/:id/edit" => "admin/customers#edit", as: "admin_customers_edit"
  patch "admin/customers/:id" => "admin/customers#update", as: "update_admin_customers"

  get "customer" => "public/customers#show", as: "customers_show"
  get "customer/edit" => "public/customers#edit", as: "customer_edit"
  patch "customer" => "public/customers#update", as: "customer_update"
  get "customer/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw", as: "withdraw"

  get "adresses" => "public/adress#index", as: "adress_index"
  get "adresses/:id/edit" => "public/adress#edit", as: "adress_edit"
  post "adresses" => "public/adress#create"
  patch "adresses/:id" => "public/adress#update", as: "update_adress"
  delete "adresses/:id" => "public/adress#destroy", as: "destroy_adress_path"

  get "items" => "public/items#index", as: "items_index"
  get "items/:id" => "public/items#show", as: "items_show"

  get "cart_items" => "public/cart_items#index", as: "cart_item_index"
  patch "cart_items/:id" => "public/cart_items#update", as: "cart_items_update"
  delete "cart_items/:id" => "public/cart_items#destroy", as: "cart_items_destroy"
  delete "cart_items/all_destroy" => "public/cart_items#all_destroy"
  post "cart_items" => "public/cart_items#create", as: "cart_items_create"

  get "orders/new" => "public/orders#new", as: "orders_new"
  post "orders/confirm" => "public/orders#confirm", as: "order_confirm"
  get "order/complete" => "public/orders#complete", as: "order_complete"
  post "orders" => "public/orders#create", as: "order_creat"
  get "orders" => "public/orders#index", as: "order_index"
  get "orders/:id" => "public/orders#show", as: "order_show"

end
