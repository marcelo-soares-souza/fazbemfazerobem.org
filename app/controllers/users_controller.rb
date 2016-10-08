class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
end
