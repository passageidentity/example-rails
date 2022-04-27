require 'passageidentity'
require 'net/http'

class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    PassageClient = Passage::Client.new(app_id: Rails.application.config.passage_app_id, api_key: Rails.application.config.passage_api_key)

    def authorize!
      begin
        @user_id = PassageClient.auth.authenticate_request(request)
        user = PassageClient.user.get_user(user_id: @user_id)
        session[:psg_username] = user.email
        session[:psg_username] = user.phone if user.email.nil? || user.email.empty?
      rescue Exception => e
        redirect_to "/unauthorized"
      end
    end
  end