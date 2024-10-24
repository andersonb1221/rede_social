Rails.application.routes.draw do
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
  resources :comentarios
  resources :messages

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users do
    member do
      post 'follow'
      delete 'unfollow'
    end
  end

  root 'home#index'

  get '/seguidores/user/:id', to: 'seguidores#index'
  get '/show/seguidor/:id', to: 'seguidores#show'
  get '/search/seguidor/user/:id', to: 'seguidores#index'


  get 'page_inicial', to: 'page_inicial#index'

  post '/bio', to: 'users#bio'
  get '/user/:id', to: 'users#show'
  get '/perfil', to: 'users#perfil'

  get '/seguidos/user/:id', to: 'seguidos#index'
  get '/show/seguido/:id', to: 'seguidos#show'
  get '/search/seguido/user/:id', to: 'seguidos#index'

  get '/user/:id/post/:post_id', to: 'users#show'

  post '/new_comentario/post/:post_id', to: 'comentarios#create'

  post '/new_message/user/:recipient_id', to: 'messages#send_message'
  
  get "up" => "rails/health#show", as: :rails_health_check

end
