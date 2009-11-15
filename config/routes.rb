ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home', :action => 'index'
  
  map.with_options :controller => 'sessions' do |session|
    session.login 'login', :action => 'new'
    session.logout 'logout', :action => 'destroy'
    session.create_session 'sessions/create', :action => 'create'
  end
  
  map.resources :users 
  
  map.resources :travels

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
