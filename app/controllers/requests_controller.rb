class RequestsController < ApplicationController
  # before_action :view_application
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_request, only: %i[ show edit update destroy ]

  # GET /requests or /requests.json
  def index
    if(session[:applicant_id] != nil)
      @requests = Request.all.where("applicant_id ="+session[:applicant_id].to_s )
    else
      @requests = Request.all
    end
  end

  # GET /requests/1 or /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests or /requests.json
  def create

    # request_params[:property_id] = params[:propertyid]
    # request_params[:applicant_id] = params[:applicant_id]
    puts request_params[:property_id]
    # print params[:propertyid]
    # request_params[:status] = 0
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def accept_application
    propertyid = Request.find(params[:request_id])[:property_id]
    all_requests = Request.where(property_id: propertyid)
    all_requests.each do |request|
      if request.id != params[:request_id]
        request[:status] = "rejected"
        request.save
      end
    end

    object = Request.find(params[:request_id])
    object[:status] = "approved"
    object.save

    property_object = Property.find(object.property_id)
    property_object[:applicant_id] = object.applicant_id
    property_object.save

    redirect_to requests_url, notice: "Congratulations! Application accepted."
  end

  def reject_application
    application_object = Request.find(params[:request_id])
    application_object[:status] = "rejected"
    application_object.save
    redirect_to requests_url, notice: "Application rejected"
  end

  def withdraw_application
    application_object = Request.find(params[:request_id])
    application_object[:status] = "withdraw"
    application_object.save
    redirect_to requests_url, notice: "Application withdrawn"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:status, :applicant_id, :property_id)
    end
end
