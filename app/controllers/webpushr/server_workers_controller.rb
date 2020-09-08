class Webpushr::ServerWorkersController < ApplicationController
  protect_from_forgery except: :index

  def index
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
end
