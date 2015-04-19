Onholiday::Application.routes.draw do
  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "/contact", to: "pages#contact", as: "contact"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"

  resource :vacation_request
  get "annual_leaves", to: "vacation_requests#index", as: "vacation_requests"


  get "/timetable", to: "work_hours#index", as: "timetable"

  post "/working_hour/add/:user_id/:day/:hour", to: "work_hours#add"
  post "/working_hour/remove/:user_id/:day/:hour", to: "work_hours#remove"


  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users

  end

end
