class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  
  def index
    @events = Event.all
  end

  def show
  end


  def new
    @event = Event.new
  end

  def create
    @event = @user.events.build(event_params)

    if @event.save
      redirect_to user_profile_path(@user)
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to user_event_path(@user.id, @event.id), notice: 'Event updated'
    else
      render :edit
    end  
  end

  def destroy
    @event.destroy
    redirect_to user_profile_path(@user)
  end

  private
  def event_params
      params.require(:event).permit(:start_time,
                                    :stop_time,
                                    :venue_address,
                                    :venue_name,
                                    :venue_address,
                                    :city_name,
                                    :image_url,
                                    :description,
                                    :category,
                                    :genre, 
                                    :name, 
                                    :rating, 
                                    :website, 
                                    :user_id,
                                    :eventful_id)
    
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
