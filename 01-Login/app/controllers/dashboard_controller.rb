require 'passage'

class DashboardController < ApplicationController

  before_action :authenticate_request

  def index
    puts(session[:psg_user_id])
    @test = session[:psg_user_id]
  end
end