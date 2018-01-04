Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  namespace :api do
    namespace :v1 do
      resources :ghosts,  :except => [:new, :show, :edit] do 
        get 'search', :on => :collection
      end

      resources :events,  :except => [:new, :show, :edit] do 
        get 'search', :on => :collection
        
        get 'start',  :on => :member
        get 'end',    :on => :member

        get 'add_participant',    :on => :member
        get 'remove_participant', :on => :member
        get 'queue_participant',  :on => :member
      end

      resources :users,  :only => [] do
        post 'authenticate', :to => "authenticate", :on => :collection
        post 'register',     :to => "create",  :on => :collection
      end
    end
  end
end