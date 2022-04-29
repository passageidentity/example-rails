
class DashboardController < ApplicationController

  before_action :authorize!, except: %i[unauthorized]

  def authorized
    user = PassageClient.user.get(user_id: @user_id)
    username = user.email
    username = user.phone if user.email.nil? || user.email.empty?
    @user = username
  end

  def unauthorized
  end
end