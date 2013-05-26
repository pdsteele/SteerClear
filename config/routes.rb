SteerClear::Application.routes.draw do

  devise_for :workers, :controllers => { :registrations => "workers/registrations", :sessions => "workers/sessions" }

  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :shifts

  root :to => 'pages#home'


  match '/workers/startShift', :to => 'shifts#create'
  match '/workers/inService/', :to => 'shifts#makeInService'
  match '/workers/offService/', :to => 'shifts#makeOffService'
  match '/workers/endShift/', :to => 'shifts#endShift'
  match '/workers/updateAddress', :to => 'shifts#updateAddress'

  match '/createRequest', :to => 'rideRequests#create'
  match '/users/showRequest/:id(.:format)', :to => 'rideRequests#show'
  match '/updateRequest', :to => 'rideRequests#update'
  match '/destroyRequest/', :to => 'rideRequests#destroy'


  match '/users', :to => 'users#show'
  match '/workers', :to => 'workers#show'
  match '/about',   :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/employees', :to => 'pages#employeeinfo'

  #for static hosted files
  match '/ConstitutionBylaws.pdf', :to => 'pages#download_bylaws'
  match '/HiringContract.doc', :to => 'pages#download_contract'
  match '/TrainingEmploymentPacket2012-13.docx', :to => 'pages#download_training'
  match '/PayrollProcess2012.doc', :to => 'pages#download_payroll'

end
