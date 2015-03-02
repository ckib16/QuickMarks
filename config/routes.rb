Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :likes, only: [:create, :destroy]

  devise_for :users

  get 'about' => 'welcome#about'

  post :incoming, to: 'incoming#create'

  root to: 'welcome#index'

end
