Dasi::Application.routes.draw do
  #root path
  root to: 'home#index'

  #가입 path.
  match '/signin' => 'sessions#new'
  
  #for user session. ( facebook login, signout)
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  #for songs
  resources :songs, only: [:create]

  #for songtags
  resources :songtags, only: [:show, :create, :index]
  get 'songtags/:id/:song_id' => 'songtags#show'
  get 'songtags' => 'songtags#index'
  get 'songs/show/:id' => 'songtags#show_song'
  
  #for enrolling songs to songtag
  get '/songtags/:tag_id/song/new' =>'songs#new'

  #for votes
  resources :votes, only: [:create, :destroy]
  #for comments
  resource :comments, only: [:create] #추후 update, destroy 구현. ajax로  해야할 것 같으므로 패스함
  match '/comments/paging' => 'comments#paging', :via => :post
  match '/comments/recmt_paging' => 'comments#recmt_paging', :via => :post

  resource :comment_logs, only: [:create, :destroy] #like, dislike create, destroy, 이하 다른 작업은 필요해 보이지 않음.
  
  #for feedbacks
  resources :feedbacks, only: [:create]
  
  #for search
  get 'search' => 'search#index'
end
