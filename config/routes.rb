Rails.application.routes.draw do

  resources :roles

  resources :levels

  resources :categories

  resources :theories




  resources :articles do
    collection do
      put :approve
    end
  end

 get '/moderation/articles' => 'articles#moderation', as: 'moderation_articles'
 put '/approve/articles' => 'articles#approve', as: 'approve_articless'

 get '/moderation/theories' => 'theories#moderation', as: 'moderation_theories'
 put '/approve/theories' => 'theories#approve', as: 'approve_theories'

 get '/moderation/links' => 'links#moderation', as: 'moderation_links'
 put '/approve/links' => 'links#approve', as: 'approve_links'

 get '/moderation/vocabularies' => 'vocabularies#moderation', as: 'moderation_vocabularies'
 put '/approve/vocabularies' => 'vocabularies#approve', as: 'approve_vocabularies'

 get '/moderation/words' => 'words#moderation', as: 'moderation_words'
 put '/approve/words' => 'words#approve', as: 'approve_words'
   resources :words


 resources :vocabularies do
    resources :words
  end

  scope module: 'contests' do
   resources :surveys
   resources :attempts
  
  end

 # mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  resources :news

  get 'theories/level/:id' => 'theories#fromlevel', as: 'theories_level'
  get 'articles/level/:id' => 'articles#fromlevel', as: 'articles_level'
  get 'vocabularies/level/:id' => 'vocabularies#fromlevel', as: 'vocabularies_level'
  get 'links/category/:id' => 'links#fromcategory', as: 'links_category'

 #get 'showtheories/:id' => 'levels#show_theories'

  devise_for :users
resources :users 

  resources :links
  resources :images

  post 'tinymce_assets' => 'tinymce_assets#create'
  post 'news/new/tinymce_assets' => 'tinymce_assets#create'
  post 'articles/new/tinymce_assets' => 'tinymce_assets#create'
  post 'theories/new/tinymce_assets' => 'tinymce_assets#create'

  get 'about' => 'pages#about', as: 'about'
  root to: "news#index"


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
