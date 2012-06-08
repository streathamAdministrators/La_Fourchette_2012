LaFourchette2012::Application.routes.draw do
    
    #Point d'entrée par l'index de la vue index de tables
    root :to => 'clients#index'
    #root :to => 'clients#temp'
    
    #Gestion de l'authentification
    get "login" => "sessions#new", :as => 'login'
    get "logout" => "sessions#destroy", :as => 'logout'

    resources :sessions
  
    #Routes pour le controller Client
    get "/clients/index"
    post "/clients/initTable" => "clients#initTable"
    get "/clients/:id" => "clients#show", :as => 'show'
    get "/meals" => "clients#meal" 
    get "/items" => "clients#item"
    get "/drinks" => "clients#drink"
    
    
    resources :meals, :items
    
      #Routes pour le namspace Admin
      namespace :admin do
        root :to => 'restaurants#welcome', :as => 'welcome'
        
        resources :restaurants, :employees, :tables, :javascripts, :product_types, :items, :meals
        
        get "/admin/javascripts/dynamic_employee", "/admin/javascripts/dynamic_restaurant"
        get '/employees/show/:restaurant_id' => "employees#show", :as => "employees_restaurant"
        
        match '/item/desactivate/:id' => 'items#desactivate', :as => 'item_desactivate'
        match '/item/activate/:id' => 'items#activate', :as => 'item_activate'
        
        match '/table/desactivate/:id' => 'tables#desactivate', :as => 'table_desactivate'
        match '/table/activate/:id' => 'tables#activate', :as => 'table_activate'
        
        match '/restaurant/desactivate/:id' => 'restaurants#desactivate', :as => 'restaurant_desactivate'
        match '/restaurant/activate/:id' => 'restaurants#activate', :as => 'restaurant_activate'
        
        match '/employee/desactivate/:id' => 'employees#desactivate', :as => 'employee_desactivate'
        match '/employee/activate/:id' => 'employees#activate', :as => 'employee_activate'
        
        match '/meals/desactivate/:id' => 'meals#desactivate', :as => 'meal_desactivate'
        match '/meals/activate/:id' => 'meals#activate', :as => 'meal_activate'
        
        match '/product_types/desactivate/:id' => 'product_types#desactivate', :as => 'product_type_desactivate'
        match '/product_types/activate/:id' => 'product_types#activate', :as => 'product_type_activate'        
      end
      
      #Routes pour le namespace staff
      namespace :staff do
        root :to => 'waiters#index', :as => 'index'
        
        resources :waiters, :kitchen
        
        get '/tables' => 'waiters#table', :as => 'waiter_table'
        get '/orders/:table_id' => 'waiters#order', :as => 'order'
        
        get '/check_orders/:table_id' => 'waiters#check_orders', :as => 'waiter_check_orders'
        
        get '/change_element_states/:element_id' => 'waiters#change_element_states', :as => 'waiter_element_states'
        
        
        get '/elements' => 'kitchens#index', :as => 'element_index'
        get '/check_elements' => 'kitchens#check_elements', :as => 'kitchen_check_elements'
        
        match '/kitchens/accept/:id' => 'kitchens#accept', :as => 'kitchen_accept'
        match '/kitchens/cooked/:id' => 'kitchens#cooked', :as => 'kitchen_cooked'
        
      end
      
    get "javascripts/dynamic_employee", "javascripts/dynamic_restaurant"

   # map.connect :admin, :namespace => "admin", :controller => "admin"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end