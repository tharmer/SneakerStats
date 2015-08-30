Rails.application.routes.draw do
  resources :reviews, except: [:show, :index]
  devise_for :users
  resources :sneakers do
      resources :reviews, except: [:show, :index]
    end
  get 'pages/about'

  get 'pages/contact'
  
  root 'sneakers#index'

end
