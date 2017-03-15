Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #make event
  root to: 'events#test'

  get '/dashboard' => 'events#dashboard'

  get '/endpoint' => 'events#endpoint'
  
  post '/events' => 'events#create'

  #venue info
  post '/events/:id/venue' => 'events#venue'

  #promoter info
  post '/events/:id/promoter' => 'events#promoter'

  #picture / text of set list
  post '/events/:id/setlist' => 'events#setlist'

  #setlist calls
  #attach composers
  #attach songs and their composers

  post '/events/:id/composers' => 'events#composer'

  post '/events/:id/songs' => 'events#song'

  post '/events/:id/location' => 'events#geomap'
end
