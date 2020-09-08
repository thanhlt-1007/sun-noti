Rails.application.routes.draw do
  root "home#index"

  get "/webpushr-sw", to: "webpushr/server_workers#index"
end
