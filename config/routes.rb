Rails.application.routes.draw do
  resources :destinations, only: [:index, :show]
  resources :bloggers
  resources :posts

  post '/posts/:id/likes', to: 'posts#add_likes', as: 'like'

end
