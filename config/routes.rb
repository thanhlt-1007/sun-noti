Rails.application.routes.draw do
  root "notifications#new"

  get "/webpushr-sw", to: "webpushr/server_workers#index"
end
