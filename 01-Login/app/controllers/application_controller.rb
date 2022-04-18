require 'passage'

class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    Passage = Passage::Client.new(app_id: Rails.application.config.passage_app_id)

    
    def authorize!
      begin
        @user_id = Passage.auth.authenticate_request(request)
        # if error, redirect to unauthorized page 
        # TODO
        puts(@user_id)
        session[:psg_user_id] = @user_id
      rescue Exception => e
        # unauthorized
        redirect_to "/unauthorized"
      end
    end
  end