Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "articles#index"
  
  resources :articles do
    resources :comments
    resources :likes
  end

  resources :comments do
    resources :comments
  end
  
  resources :users, except: [:new]
 
  get 'about', to: 'home_pages#about'
  get 'contact', to:'home_pages#contact'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #mount Commontator::Engine => '/commontator'
end
