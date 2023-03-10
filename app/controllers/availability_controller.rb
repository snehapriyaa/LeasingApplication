class AvailabilityController < ApplicationController
  def index
    @properties = Property.select("
    COUNT(*) as total,
    name,
    COUNT(applicant_id) as taken
  ").group(:name).all
  end
end
