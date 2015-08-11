Rails.application.routes.draw do
  get "/current", controller: :statuses, action: :current
  get "/statuses", controller: :statuses, action: :index
end
