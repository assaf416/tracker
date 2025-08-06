class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  #allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :device

  def device
    agent = request.user_agent
    @device = "Desktop"
    @device = "Mobile" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    @device = "Mobile" if agent =~ /Mobile/
  end

  def mobile?
    @device == "Mobile"
  end
end
