Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  namespace :api do
    namespace :v1 do
      resources :ghosts,  :except => [:new, :show, :edit] do 
        get 'search', :on => :collection
      end

      resources :achievements, :only => [:index]

      resources :events,  :except => [:new, :show, :edit] do         
        post 'start_event',        :on => :member
        post 'end_event',          :on => :member
        post 'add_participant',    :on => :member
        post 'remove_participant', :on => :member

        get 'search', :on => :collection
      end

      resources :users,  :only => [] do
        post 'authenticate', :to => "authenticate", :on => :collection
        post 'register',     :to => "create",       :on => :collection

        get 'feed',      :on => :member
        get 'friends',   :on => :member
        get 'followers', :on => :member

        post 'add_friend',    :on => :member
        post 'remove_friend', :on => :member
        post 'like_post',     :on => :member
        post 'unlike_post',   :on => :member

        resources :posts,        :only => [:index, :create]
        resources :achievements, :only => [:index, :create]
      end
    end
  end
end