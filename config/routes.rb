Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, skip: [:sessions, :passwords, :confirmations, :registrations]
  as :user do
    # session handling
    get     '/signin'  => 'devise/sessions#new',     as: 'new_user_session'
    post    '/signin'  => 'devise/sessions#create',  as: 'user_session'
    delete  '/signout' => 'devise/sessions#destroy', as: 'destroy_user_session'

    # account creation
    get   '/signup' => 'devise/registrations#new',    as: 'new_user_registration', :controllers => { registrations: 'registrations' }
    post  '/signup' => 'devise/registrations#create', as: 'user_registration', :controllers => { registrations: 'registrations' }

    scope '/myaccount' do
      # see all your deals
	  get 	'/mydeals' => 'deals#index', as: 'my_account_deals'
	  
	  # password reset
      get   '/reset-password'        => 'devise/passwords#new',    as: 'new_user_password'
      put   '/reset-password'        => 'devise/passwords#update', as: 'user_password'
      post  '/reset-password'        => 'devise/passwords#create'
      get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_user_password'

      # settings & cancellation
      get '/cancel'   => 'devise/registrations#cancel', as: 'cancel_user_registration'
      get '/settings' => 'devise/registrations#edit',   as: 'edit_user_registration'
      put '/settings' => 'devise/registrations#update'

      # account deletion
      delete '/close' => 'devise/registrations#destroy', as: 'close_account'
    end
  end
  #devise_for :users, controllers: { registrations: "registrations" }
  
  #get "get-started", :to => "deals#new", :as => :get_started
  get	'/get-started'	=> 'deals#new',			as: 'deals'
  post	'/get-started'	=> 'deals#create'
  
  get '/admin'	=> 'admin#index',	as: 'admin'
  
  get	'/messages' => 'messages#index'
  post	'/messages' => 'messages#create'
  
end
