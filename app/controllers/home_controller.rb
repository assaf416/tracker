class HomeController < ApplicationController
  include ApplicationHelper

  def set_theme
    current_user.schema = params[:theme]
    current_user.save
    redirect_to request.referrer
  end

  def set_language
    current_user.language = params[:language]
    current_user.save
    redirect_to request.referrer
  end

  def delivery_dispatcher
  end

  def index
  end

  def rides
    @drivers = Driver.all.sample(3)
    @rides = Ride.all.sample(10)
  end

  def ride
    redirect_to "/home/ride_mobile?id=#{params[:id]}" if device_mobile?(request)
    @drivers = Driver.all.sample(3)
    @device = Device.find(params[:id])
    @driver = Driver.all.sample(3)[0]
    @activities = @device.activities
    @drivers = Driver.all.sample(3)
    begin
      @ride = Ride.find(params[:id])
    rescue
      @ride = Ride.first
    end
  end

  def ride_mobile
    @drivers = Driver.all.sample(3)
    @device = Device.find(params[:id])
    @driver = Driver.all.sample(3)[0]
    @activities = @device.activities
    begin
      @ride = Ride.find(params[:id])
    rescue
      @ride = Ride.first
    end
    render :layout => "mobile"
  end

  def activities
    @actvities = Activity.all.sample(10)
  end

  def drivers
    @drivers = Driver.all.sample(5)
  end

  def driver
    redirect_to "/home/driver_mobile?id=#{params[:id]}" if device_mobile?(request)
    @driver = Driver.find(params[:id])
  end

  def driver_mobile
    @drivers = Driver.all.sample(3)
    @driver = Driver.find(params[:id])
    render :layout => "mobile"
  end

  def devices
    @drivers = Driver.all.sample(3)
    @devices = Device.all.sample(3)
  end

  def device
    redirect_to "/home/device_mobile?id=#{params[:id]}" if device_mobile?(request)
    @drivers = Driver.all.sample(3)
    @device = Device.find(params[:id])
    @driver = Driver.find(@device.driver_id)
    @activities = @device.activities
  end

  def device_mobile
    @drivers = Driver.all.sample(3)
    @device = Device.find(params[:id])
    @driver = Driver.find(@device.driver_id)
    @activities = @device.activities
    render :layout => "mobile"
  end

  def ticket
    redirect_to "/home/ticket_mobile?id=#{params[:id]}" if device_mobile?(request)
    @device = Ticket.find(params[:id])
  end

  def ticket_mobile
    @device = Ticket.find(params[:id])
    render :layout => "mobile"
  end

  def tickets
    @tickets = Ticket.all.sample(3)
  end

  def device
    begin
      @device = Device.find(params[:id])
    rescue
    end
  end

  def units
    @units = DeviceKind.all
  end

  def tickets
  end

  def map
    @devices = current_user.devices
  end

  def taxi_dispatcher
  end

  def taxi_driver
    render :layout => "mobile"
  end

  def dashboard
  end
end
