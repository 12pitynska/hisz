Rails.application.routes.draw do

  resources :roles, :path => "role"
  resources :levels, :path => "poziomy"
  resources :categories, :path => "kategorie"
  resources :theories, :path => "zagadnienia"

  resources :articles, :path => "artykuly" do
    collection do
      put :approve
    end
  end

  get '/moderacja/artykuly' => 'articles#moderation', as: 'moderation_articles'
  put '/zatwierdz/artykuly' => 'articles#approve', as: 'approve_articless'

  get '/moderacja/zagadnienia' => 'theories#moderation', as: 'moderation_theories'
  put '/zatwierdz/zagadnienia' => 'theories#approve', as: 'approve_theories'

  get '/moderacja/linki' => 'links#moderation', as: 'moderation_links'
  put '/zatwierdz/linki' => 'links#approve', as: 'approve_links'

  get '/moderacja/slownictwo' => 'vocabularies#moderation', as: 'moderation_vocabularies'
  put '/zatwierdz/slownictwo' => 'vocabularies#approve', as: 'approve_vocabularies'
 
  get '/moderacja/slowa' => 'words#moderation', as: 'moderation_words'
  put '/zatwierdz/slowa' => 'words#approve', as: 'approve_words'

  resources :words, :path => "slowa"

  resources :vocabularies, :path => "slownictwo" do
    resources :words, :path => "slowa"
  end

  scope module: 'contests' do
     resources :surveys, :path => "cwiczenia"
     resources :attempts, :path => "quiz"
     get '/moderacja/cwiczenia' => 'surveys#moderation', as: 'moderation_surveys'
     put '/zatwierdz/cwiczenia' => 'surveys#approve', as: 'approve_surveys'
     get 'cwiczenia/poziom/:id' => 'surveys#fromlevel', as: 'surveys_level'
  end

  resources :news, :path => "aktualnosci"

  get 'zagadnienia/poziom/:id' => 'theories#fromlevel', as: 'theories_level'
  get 'artykuly/poziom/:id' => 'articles#fromlevel', as: 'articles_level'
  get 'slownictwo/poziom/:id' => 'vocabularies#fromlevel', as: 'vocabularies_level'
  get 'linki/kategoria/:id' => 'links#fromcategory', as: 'links_category'

  devise_for :users
  resources :users, :path => "uzytkownicy"

  resources :links, :path => "linki"
  resources :images

  post 'tinymce_assets' => 'tinymce_assets#create'
  post 'aktualnosci/nowa/tinymce_assets' => 'tinymce_assets#create'
  post 'artykuly/nowy/tinymce_assets' => 'tinymce_assets#create'
  post 'zagadnienia/nowy/tinymce_assets' => 'tinymce_assets#create'

  get 'oserwisie' => 'pages#about', as: 'about'

  root to: "news#index"

  match "*path", :to => "application#routing_error", :via => :all




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
