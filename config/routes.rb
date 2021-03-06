Rails.application.routes.draw do
  # user controller

  get 'user/signup'

  post 'user/signup_complete'

  get 'user/login'

  post 'user/login_complete'

  get 'user/logout_complete'

  # post controller

  root 'foods#posts'
  get '/:align' => 'foods#posts'
  get 'foods/show/:id' => 'foods#show'
  get 'foods/write'
  post 'foods/write_complete'
  get 'foods/edit/:id' => 'foods#edit'
  post 'foods/edit_complete'
  get 'foods/delete/:id' => 'foods#delete_complete'
  post 'foods/comment_write_complete'
  get '/:category/:align' => 'foods#posts_category'

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
