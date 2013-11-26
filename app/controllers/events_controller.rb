class EventsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @event = current_user.events.find(params[:id])
  end

  def new
    @user = current_user
    @event = @user.events.new
  end

  def create
    @user = current_user
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to current_user
      flash[:success] = "Successfully created..."
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to current_user 
      flash[:success] = "Successfully updated..."
    else
      render :edit
    end
  end

  def destroy 
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to current_user
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_date, :venue, :city, 
                                  :state, :country, :event_url, :confirmed, :description)
  end
end

