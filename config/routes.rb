Rails.application.routes.draw do
  resources :waitlists
  resources :availability
  root 'home#index'
  resources :agents
  resources :requests do
    member do
      get 'change_status'
    end
  end
  resources :admins
  resources :properties
  resources :applicants
  resources :sessions, only: [:new, :create, :destroy]
  resources :rented

  get 'signup', to: "applicants#new", as: 'signup'
  get 'signupasagent', to: "agents#new", as: 'signupasagent'
  get 'acceptstatus', to: "requests#accept_application", as: 'acceptstatus'
  get 'rejectstatus', to: "requests#reject_application", as: 'rejectstatus'
  get 'withdrawstatus', to: "requests#withdraw_application", as: 'withdrawstatus'
  get 'waitlistacceptstatus', to: "waitlists#accept_waitlist", as: 'waitlistacceptstatus'
  get 'waitlistwithdrawstatus', to: "waitlists#withdraw_waitlist", as: 'waitlistwithdrawstatus'
  get 'waitlistrejectstatus', to: "waitlists#reject_waitlist", as: 'waitlistrejectstatus'
  get 'checkout', to: "properties#checkout", as: "checkout"
  get 'login', to: "sessions#new", as: 'login'
  get 'logingoogle', to: redirect('/auth/google_oauth2'), as: 'logingoogle'
  get 'googlelogintype', to:"sessions#googlelogintype", as: 'googlelogintype'
  get 'auth/google_oauth2/callback', to: 'sessions#googlecreate'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: "sessions#destroy", as: 'logout'
end
