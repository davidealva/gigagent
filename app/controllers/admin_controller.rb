class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    #@user = User.find(params[:id])
    @user = User.find_by_permalink(params[:id]) 
    @events = @user.events
    #@events = Event.where(:user_id => @user.id).order('events.event_date desc') 
  end
end
