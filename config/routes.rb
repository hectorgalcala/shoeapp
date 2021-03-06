Rails.application.routes.draw do
  devise_for :users
  root to: 'shop#index'
  get 'payment-details', to: "charges#details"
  post 'charge', to: "charges#charge"
  devise_for :admin_users, controllers: {
        sessions: 'admin_users/sessions'
      }
  get 'single/:slug', to: 'shop#single'
  get 'shopping_cart', to: 'shop#shopping_cart'
  get 'admin', to: 'admin#index'

  post "add_to_cart", to: "shop#add_to_cart"
  post "status", to: "shop#get_status"

  scope :admin do
    get 'orders', to: 'orders#index'
    get 'order/:id', to: 'orders#edit'
    patch 'orders/:id', to: 'orders#update'
    get 'settings', to: 'admin#settings'
    patch 'settings', to: 'admin#save_settings'
    get 'mail_to_subscribers', to: "admin#mail_to_subscribers"
    post 'send_email', to: "admin#send_mail"
    resources :products , param: :slug do
      member do
        get 'delete'
      end
      resources :characteristics, param: :slug do
        member do
          get 'delete'
        end
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
