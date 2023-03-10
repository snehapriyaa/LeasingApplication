class RentedController < ApplicationController
  def index
    @properties = Property.all.where("applicant_id ="+session[:applicant_id].to_s )
  end
end
