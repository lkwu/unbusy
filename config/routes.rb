Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :welcome do
  end

  namespace :admin do
    resources :unbusys
  end

  get '/about' =>'welcome#about'

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    post "/login" => "auth#login"
    post "/logout" => "auth#logout"

    post "/signup" => "auth#signup"

    resources :bookings

    post "/checkout_pay2go" => "payment_method#Credit"
    get '/about' => 'welcome#about'

  end

  post 'pay2go/return' # returnURL是Pay2go通知使用者付款成功
  post 'pay2go/notify' # notifyURL是Pay2go用來通知店家後台交易結果的URL

  resources :users do
    resource :profile
  end
  resources :bookings do
    member do
      post :checkout_pay2go
    end
  end





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
