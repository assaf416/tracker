class ApiController < ApplicationController
  skip_forgery_protection
  skip_before_action :authenticate_user!

  include ApplicationHelper

  require "json"

  def signed_contract
    @signed_contract = SignedContract.find(params[:id])
    @html = @signed_contract.contract.content_with_fields(@signed_contract.prospect_id)
    render :layout => false
  end

  def post_form
    puts "------------------------------------------------------"
    # puts params.keys.inspect

    email = params["personal-email"]

    if Lead.find_by_email(email).nil?
      l = Lead.create(
        :first_name => params["firstName"],
        :last_name => params["lastName"],
        :gender => params["gender"],
        :uid => params["tz"],
        :born_on => params["birthdate"],
        :email => email,
        :phone_no => params["phone"],
        :street => params["street"],
        :house_no => params["apt"],
        :city => params["city"],
        :postal => params["zip-code"],
        :source => "Impact",
        :json => params.to_json,
      )
      l.picture_a = "data:image/jpeg;base64," + params[:idFileBase64]
      l.picture_b = "data:image/jpeg;base64," + params[:cardFileBase64]
      l.save
      l.generate_pdf
    end

    :ss

    # render :plain => params.to_json
  end
end
