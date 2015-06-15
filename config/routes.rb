Rails.application.routes.draw do

  scope format: true, defaults: { format: 'json' } do
    get "/current", controller: :statuses, action: :current
    get "/statuses", controller: :statuses, action: :index
  end

end
