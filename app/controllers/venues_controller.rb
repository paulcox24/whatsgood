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
      marker.infowindow "<h6><a style=padding: 1.125em; href=http://#{venues.website}>GoTo Website</a></h6>"
    end
  end

  def show
    @locloc = []
    @venue.nearbys(10).each do |v|
      @locloc <<{lat: v.latitude, lng: v.longitude, infowindow: "<h6><a style=padding: 1.125em; href=http://#{v.website}>GoTo Website</a></h6>"}
    end 
    @locloc <<{lat: @venue.latitude, lng: @venue.longitude, infowindow: "<h6><a style=padding: 1.125em; href=http://#{@venue.website}>GoTo Website</a></h6>"}
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