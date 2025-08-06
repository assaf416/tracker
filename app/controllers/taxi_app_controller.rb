class TaxiAppController < ApplicationController
  def dispatcher
    @passengers = Passenger.all.sample(4)
    @drivers = Driver.all.sample(5)
    @devices = Device.all.sample(5)
    @rides = Ride.all.sample(5)
  end

  def ride
    @drivers = Driver.all.sample(4)
    @devices = Device.all.sample(5)
    @ride = Ride.find(params[:id])
    @passengers = Passenger.all.sample(4)
    render :layout => "mobile"
  end

  def driver
    @drivers = Driver.all
    @devices = Device.all.sample(5)
    @rides = Ride.all
    @passengers = Passenger.all.sample(40)
    respond_to do |format|
      format.html # Renders app/views/posts/show.html.erb
      format.json { render json: @post } # Renders JSON data
    end
    render :layout => "mobile"
  end

  def customer
    render :layout => "mobile"
  end
end
