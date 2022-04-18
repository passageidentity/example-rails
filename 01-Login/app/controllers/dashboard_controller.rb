
class DashboardController < ApplicationController

  before_action :authorize!, except: %i[unauthorized]

  def authorized
    puts(session[:psg_user_id])
    @user = session[:psg_user_id]
  end

  def unauthorized
  end
end