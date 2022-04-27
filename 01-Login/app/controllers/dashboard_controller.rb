
class DashboardController < ApplicationController

  before_action :authorize!, except: %i[unauthorized]

  def authorized
    @user = session[:psg_username]
  end

  def unauthorized
  end
end