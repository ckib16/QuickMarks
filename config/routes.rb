Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show]

  get 'about' => 'welcome#about'

  post :incoming, to: 'incoming#create'

  root to: 'welcome#index'

end
