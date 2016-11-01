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


  get "admin", to: "backend/pages#index"

  namespace :frontend do
    resources :ravers
  end

  get "application", to: "frontend/ravers#apply"
  post "application", to: "frontend/ravers#createapplication"
  get "lineup", to: "frontend/ravers#lineup"
  get "date", to: "frontend/ravers#date"
  get "tickets", to: "frontend/ravers#tickets"
  post "ravers/new",  to: "frontend/ravers#new"
  get "guestlist", to: "backend/guestlistls#index"

  # You can have the root of your site routed with "root"
  namespace :backend do
    resources :ravers do 
      collection do
        post 'clean_db'
      end
    end
    resources :applications
    resources :guestlists
    resources :tickets do
      collection do
        post 'generate_ticket'
      end
      member do
        post 'give'
        post 'pay'
        post 'check'
        post 'reopen'
      end
    end
    get "expenses", to: "expenses#index"
    get "users_online", to: "pages#online_users"
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
