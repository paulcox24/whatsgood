class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new(name: params[:name],
                       description: params[:description],
                       image_url: params[:image_url],
                       start_time: params[:start_time],
                       stop_time: params[:stop_time],
                       venue_address: params[:venue_address],
                       city_name: params[:city_name],
                       venue_name: params[:venue_name])
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end  
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event cancelled'
  end

  private
  def event_params
    params.require(:event).permit(:start_time, :stop_time, :venue_address, :venue_name, :venue_address, :city_name, :image_url, :description, :category, :genre, :name, :rating, :website)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
