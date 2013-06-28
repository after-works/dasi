Dasi::Application.routes.draw do
  #root path
  root to: 'home#index'
  
  #for user session. ( facebook login, signout)  
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  
  #for songs
  resources :songs

  #for songtags
  resources :songtags

  #for enrolling songs to songtag
  get '/songtags/:tag_id/song/new' =>'songs#new'
  
  #for votes
  resources :votes, only: [:create, :destroy]
end
