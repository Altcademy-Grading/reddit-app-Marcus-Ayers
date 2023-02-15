Rails.application.routes.draw do
  root to: 'static_pages#home'

  get '/subreddit/:id' => 'static_pages#subreddit'
  get 'subreddit/:sub_id/post/:post_id' => 'static_pages#post'
  get '/user/:id' => 'static_pages#user'
  get '/login' => 'static_pages#login'



  namespace :api do
    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'

  # get 'posts' => 'posts#index'
  resources :subreddits, except: [:destroy] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :update, :destroy, :index]
    end
  end
  resources :users, except: [:destroy] do
    resources :subscriptions, only: [:index]
  end
  resources :votes, only: [:create, :update, :destroy]
  resource :sessions, only: [:create, :destroy]
  get 'home/index'
  get 'posts/all', to: 'posts#all'

  get '/authenticated' => 'sessions#authenticated'

  end
end

