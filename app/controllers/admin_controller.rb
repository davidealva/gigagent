class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    #@user = User.find(params[:id])
    @user = User.find_by_permalink(params[:id]) 
    @events = @user.events
  end
end
