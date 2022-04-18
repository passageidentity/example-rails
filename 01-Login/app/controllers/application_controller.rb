class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    helper_method :authenticate_request
    
    def authenticate_request
      passage = Passage::Client.new(app_id: Rails.application.config.passage_app_id)
      @user_id = passage.auth.authenticate_request(request)
      # if error, redirect to unauthorized page 
      # TODO
      puts(@user_id)
      session[:psg_user_id] = @user_id
    end
  end