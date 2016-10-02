Rails.application.routes.draw do
  devise_for :ravers, controllers: {
      sessions: 'frontend/ravers/sessions',
      registrations: 'frontend/ravers/registrations',
      passwords: 'frontend/ravers/passwords'
  }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_scope :raver do
    root "frontend/ravers/registrations#index"
  end


  get "admin", to: "backend#index"

  namespace :frontend do
    resources :ravers
  end

  get "ravers/date", to: "frontend/ravers#date"
  post "ravers/new",  to: "frontend/ravers#new"
  # You can have the root of your site routed with "root"
  namespace :backend do
    resources :ravers
    get "expenses", to: "expenses#index"
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


  
end
