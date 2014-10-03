class VenuesController < ApplicationController 
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  
  def index
    @venues = Venue.all
    # @hash = Gmaps4rails.build_markers(@users) do |user, marker|
    #  marker.lat venue.latitude
    #  marker.lng venue.longitude
    # end
    @hash = Gmaps4rails.build_markers(@venues) do |venues, marker|
      marker.lat venues.latitude
      marker.lng venues.longitude
      # marker.lat venue.nearbys.latitude
      # marker.lng venue.nearbys.longitude 
      marker.infowindow "<a href=http://#{venues.website}>Goto Website</a>"
    end
  end

  def show
    @hash = Gmaps4rails.build_markers(@venue) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
      # marker.lat venue.nearbys.latitude
      # marker.lng venue.nearbys.longitude 
      marker.infowindow "<a href=http://#{venue.website}>Goto Website</a>"
    end
    # @secondhash = Gmaps4rails.build_markers(@secset) do |nearbyvenues, marker|
    #   marker.lat nearbyvenues.latitude.to_f
    #   marker.lng nearbyvenues.longitude.to_f
    #   marker.infowindow "<a href=http://#{secset.website}>Goto Website</a>"
    # end
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
    params.require(:venue).permit(:name, :description, :venue_type, :latitude, :longitude, :genre, :address, :phone, :email, :website)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end
end