Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'home/index'
end
