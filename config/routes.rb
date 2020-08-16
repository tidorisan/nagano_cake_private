Rails.application.routes.draw do

  root 'members/homes#top'

  namespace :members do
    resources :destinations, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:index, :show, :new, :create]
    post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
    get 'success' => 'orders#success', as: 'success'
    delete 'basket_products/alldestroy' => 'basket_products#alldestroy', as: 'basket_products_alldestroy'
    resources :basket_products, only: [:index, :create, :update, :destroy]
    resources :products, only: [:index, :show]
    get 'members/leave' => 'members#leave', as: 'members_leave'
    get 'homes/about' => 'homes#about', as:'homes_about'
    patch "members" => "members#destroy_update"
    resources :members, only: [:show, :edit, :update]
   end

  namespace :admins do
    get 'orders/top' => 'orders#top', as:'orders_top'
    resources :members, only: [:index, :show, :edit, :update]
    resources :productstypes, only: [:index, :edit, :create, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]

  end

  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
  }

  devise_for :members, controllers: {
      sessions:      'members/sessions',
      passwords:     'members/passwords',
      registrations: 'members/registrations'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end