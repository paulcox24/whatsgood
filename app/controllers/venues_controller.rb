class VenuesController < ApplicationController 
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  
  def index
    @venues = Venue.all
  end

  def show
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to @venue
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue
    else
      render :edit
    end  
  end

  def destroy
    @venue.destroy
    redirect_to venues_path, notice: 'Venue removed.'
  end

  private
  def venue_params
    params.require(:venue).permit(:name, :description, :venue_type, :genre, :location, :phone, :email, :website)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end
end